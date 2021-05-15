# TaBoard
This is a final project for Le Wagon Bootcamp (Batch #573).

This application helps you organise the multiple tabs open in your browser. 

It comes with a chrome extension to save your tabs in one click.

The Rails application has been generated using Le Wagon [Rails Template](https://github.com/lewagon/rails-templates) to make development easier, faster, cleaner and customizable.
  
💻 Live demo [_here_](https://taboard.herokuapp.com/). 
 
## Technologies Used
 - Generated using [Rails](https://rubyonrails.org/)
 - [Bootstrap](https://getbootstrap.com/) for styling and responsiveness
 - [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) for overall functions
 - [VueJS](https://vuejs.org/v2/guide/) for the sidebar to enable quick update of the page without refreshing it
 - [PostgreSql](https://www.postgresql.org/) for database

- [Prettier](https://github.com/prettier/prettier) for code formatting 

## Features
- Search for a tab 
- Add tabs from sidebar to folders 
- Create a folder
- Share your folder 
- Edit your folder and/or tabs
- Delete your tabs and/or folders


## Screenshot
![WebApp screenshot](./app/assets/images/webappGIF.gif)


## Setup

First, you need to install the chrome extension => [here](https://github.com/nicoletacalin/tabboard_chrome)

Once this is done, clone the repository

```
git clone https://git@github.com:XiwayB/TabBoard.git
```

Install dependencies

```
bundle install
```

```
brew install redis
```

## Structure

All CSS are in the ```app/assets``` folder:
  - Components: ```app/assets/stylesheets/components```
  - Pages: ```app/assets/stylesheets/pages```

All HMTL code are in the ```app/views``` folder: 
  - Layouts: ```app/views/layouts```
  - Folder related pages: ```app/views/folders```
  - Sign in page: ```app/views/layouts/devise.html.erb```

All Ruby code are in the ```app/controllers/concerns``` folder:
  - Folders functions: ```app/controllers/concerns/folders_controller.rb```
  - Tabs functions: ```app/controllers/concerns/tabs_controller.rb```
  - Share function: ```app/controllers/concerns/shares_controller.rb```
  - Authentication functions: ```app/controllers/concerns/users_controller.rb```

All JavaScript code are in the ```app/javascript/scripts``` folder.

All VueJS code is in ```app/javascript/components/sidebar.vue``` file.

## Project Status
Project is: _in progress_ ⏳

## Coming features

To do:
- Create sub-folders 
- Enable to drag and drop tabs in folders
- Add a count on tab to count how many times you clicked on it
- Render url when hover on a tab
- Write tests
- Refactor!

## Acknowledgements
- This application is developed by those amazing developers 🙌🏻: 
  - [Desmond](https://github.com/barrrricade), [Kevin](https://github.com/kkurcz), [Marshall](https://github.com/Marshall-Hao), [Nico](https://github.com/nicoletacalin) and [Xiway](https://github.com/XiwayB)

## Contributions / Contact
Our application is still in an early stage, if you would like to contribute to it, feel free to contact me first: [![Gmail Badge](https://img.shields.io/badge/xiway.banh-D14836?style=flat-square&logo=Gmail&logoColor=white&link=mailto:xiway.banh@gmail.com)](mailto:xiway.banh@gmail.com) 
