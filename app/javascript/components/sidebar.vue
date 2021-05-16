<template>
  <div
    class="position-absolute vh-100"
    style="z-index:100;right: 0; top:0; margin-right: 20px; width: fit-content; background: white"
  >
    <div id="btn-tabs">
      <div id="folder-ridge">Save Your Tabs</div>
    </div>

    <div id="box-tabs" style="">
      <div class="box-tab-header">Clean Tabs</div>
      <div class="box-tab-delete-all" @click="deleteAllTabs()">Delete All <i class="far fa-trash-alt"></i></div>
      <div id="items">
        <div v-for="(tab, index) in tabs" :key="index">
          <div class="item">
            <div class="unsaved_tabs unsaved-title">
              <img v-if="tab.icon" :src="tab.icon" class="icon-sidebar" />
              <div v-else class="icon-sidebar" style="padding-top: 0">
                <i class="fas fa-dice-d6"></i>
              </div>
              <div class="title">
                <a :href="tab.url" target="_blank">
                  {{ tab.short_title }}
                </a>
                <!-- <%= link_to tab.title.truncate(25, separator: '', omission:
              '...'), tab.url, target: '_blank' %> -->
              </div>
            </div>
            <div class="unsaved_tabs unsaved-link">
              <div class="link">
                <a :href="tab.url" target="_blank">
                  {{ tab.short_url }}
                </a>
                <!-- <%= link_to tab.url.truncate(50, separator: '', omission: '...'), -->
                <!-- tab.url, target: '_blank' %> -->
              </div>
              <div class="options trash">
                <!-- <%= link_to tab_path(tab), method: :delete do %> -->
                <i @click="deleteTab(tab.id)" class="far fa-trash-alt"></i>
                <!-- <% end %> -->
              </div>
              <div
                id="add_to_folder"
                :data-id="`${tab.id}`"
                class="options folder"
                @click="showFolderForm(tab.id)"
              >
                <i class="fas fa-folder-plus"></i>
              </div>
              <!-- <div id="test-button" class="options"><i class="fas fa-folder-plus"></i></div> -->
            </div>
            <div :id="tab.id" class="unsaved_tabs form hidden2">
              <form>
                <div class="form-group">
                  <select
                    v-model="folder_id"
                    class="form-control"
                    id="addFolder"
                    data-behavior="choicesjs"
                  >
                    <!-- you are here -->
                    <option
                      v-for="(folder, index) in folders"
                      :key="index"
                      class="folderChoice"
                      :value="folder.id"
                      >{{ folder.name }}</option
                    >
                  </select>
                </div>
                <div
                  type="submit"
                  class="add-folder-btn btn"
                  @click="addToFolder(tab)"
                  style="margin: 0;"
                >
                  Add
                </div>
              </form>
            </div>

            <!-- <div

              class="unsaved_tabs form hidden2"
              <%="form_with(model:"
              tab)
              do
              |f|
              %
            > -->
            <!-- > <%= f.collection_select :folder_id, policy_scope(Folder), :id,
              :name, { prompt: "Select..."}, { 'data-behavior' => 'choicesjs' }
              %> <%= f.submit 'Add to folder' %> <% end %>
            </div> -->
          </div>
        </div>
        <!-- <% end %> -->
      </div>
      <div class="box-tab-header" style="margin-top: 55px;">Relax Minds</div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Sidebar',
  props: {},
  data: function() {
    return {
      id: 1,
      tabs: [],
      folders: [],
      folder_id: null,
    };
  },
  mounted() {
    console.log('sidebar component is mounted');
    this.fetchTabs();
    this.fetchFolders();
  },
  //   ready() {
  //     console.log('sidebar component is ready');
  //   },
  methods: {
    fetchTabs() {
      //   this.tabs = [];
      //   console.log('fetching tabs');
      const url = `/unsaved_tabs`;
      this.$ax.get(url).then((res) => {
        // console.log('fetch unsaved tabs res:', res);
        this.tabs = res.data.tabs;
      });
    },

    showFolderForm(id) {
      console.log('inshow folder form', id);
      //   let form = document.getElementById(`addFolderForm_${id}`);
      let form = document.getElementById(`${id}`);
      form.classList.toggle('hidden2');
    },

    fetchFolders() {
      console.log('fetching folders');
      const url = `/fetch_folders?format=json`;
      this.$ax.get(url).then((res) => {
        // console.log('fetch folders res:', res.data);
        this.folders = res.data;
        // console.log('this.folders', this.folders);
      });
    },

    addToFolder(tab) {
      console.log('folder_id', this.folder_id);
      console.log('add to folder: folder, tab:', tab);
      const url = `/tabs/${tab.id}?format=json`;
      const body = {
        tab: {
          folder_id: this.folder_id,
        },
      };
      this.$ax.put(url, body).then((res) => {
        console.log('moved tab:', res);
        // this.tabs = res.data.tabs;
        this.fetchTabs();
      });
    },
    deleteTab(tab) {
      console.log('tab', tab);
      const url = `/tabs/${tab}?format=json`;
      this.$ax.delete(url).then((res) => {
        console.log('deleted tab:', res);
        // this.tabs = res.data.tabs;
        this.fetchTabs();
      });
    },
    deleteAllTabs() {
      this.tabs = [];
      const url = `/unsaved_tabs`;
      this.$ax.delete(url).then((res) => {
        console.log('deleted tab:', res);
        // this.tabs = res.data.tabs;
        this.fetchTabs();
      });
    },

    
  },
};
</script>
