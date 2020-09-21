# contentful_recipes_cc

## A sample web application that displays recipes, fetching them from a Contentful API endpoint

There are two views:

1. A list view of all recipes
2. A detail view of a recipe

When clicking on a recipe on the list view, it will show the detailed view.

### Installation

```bash
bundle install
```

### Testing

```bash
bundle exec rails test
bundle exec rails test:system
```

### Launch

The application requires the following environment variables to be defined.

```bash
CONTENTFUL_SPACE_ID
CONTENTFUL_ACCESS_TOKEN
CONTENTFUL_ENV_ID
```

Once they have been exported, you can run the application as follows:

```console
bundle exec rails s
```
