#!/usr/bin/env bash

cd docroot

#mysql access credentials. Should be changed.
../vendor/bin/drush site-install --db-url=mysql://root:123@localhost/d8hwl7

#https://www.drupal.org/node/2583113
../vendor/bin/drush config-set "system.site" uuid "adf6c75e-7d9f-4f5a-830a-e095ed9b8191"
../vendor/bin/drush ev '\Drupal::entityManager()->getStorage("shortcut_set")->load("default")->delete();';
../vendor/bin/drush pmu shortcut -y;
../vendor/bin/drush en shortcut -y;

