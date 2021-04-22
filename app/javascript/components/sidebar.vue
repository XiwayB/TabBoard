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
      <div id="items">
        <div v-for="(tab, index) in tabs" :key="index">
          <div class="item">
            <div class="unsaved_tabs unsaved-title">
              <img v-if="tab.icon" :src="tab.icon" class="icon" />
              <div v-else class="icon" style="padding-top: 2px">
                <i class="fas fa-dice-d6"></i>
              </div>
              <div class="title">
                <a :href="tab.url" target="_blank">
                  {{ tab.title }}
                </a>
                <!-- <%= link_to tab.title.truncate(25, separator: '', omission:
              '...'), tab.url, target: '_blank' %> -->
              </div>
            </div>
            <div class="unsaved_tabs unsaved-link">
              <div class="link">
                <a :href="tab.url" target="_blank">
                  {{ tab.url }}
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
                @click="showFolderForm"
              >
                <i class="fas fa-folder-plus"></i>
              </div>
              <!-- <div id="test-button" class="options"><i class="fas fa-folder-plus"></i></div> -->
            </div>
            <div id="addFolderForm" class="unsaved_tabs form hidden2">
              <form>
                <div class="form-group">
                  <select
                    class="form-control"
                    id="addFolder"
                    data-behavior="choicesjs"
                  >
                    <div v-for="(folder, index) in folders" :key="index">
                      <option class="folderChoice" :value="folder.id">{{
                        folder.name
                      }}</option>
                    </div>
                  </select>
                </div>
                <button class="btn btn-primary" @click="addToFolder(tab.id)">
                  Add
                </button>
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
    };
  },
  mounted() {
    console.log('sidebar component is mounted');
    this.fetchTabs();
    this.fetchFolders();
  },
  ready() {
    console.log('sidebar component is ready');
  },
  methods: {
    fetchTabs() {
      //   this.tabs = [];
      console.log('fetching tabs');
      const url = `/unsaved_tabs`;
      this.$ax.get(url).then((res) => {
        console.log('fetch unsaved tabs res:', res);
        this.tabs = res.data.tabs;
      });
    },

    showFolderForm() {
      console.log('inshow folder form');
      let form = document.getElementById('addFolderForm');
      form.classList.toggle('hidden2');
    },

    fetchFolders() {
      console.log('fetching folders');
      const url = `/folders?format=json`;
      this.$ax.get(url).then((res) => {
        console.log('fetch folders res:', res.data);
        this.folders = res.data;
      });
    },

    addToFolder(tab) {
      console.log('tab', tab);
      const url = `/tabs/${tab}?format=json`;
      this.$ax.delete(url).then((res) => {
        console.log('deleted tab:', res);
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
  },
};
</script>
