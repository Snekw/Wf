/**
 *  wfApi,
 *  Copyright (C) 2018 Ilkka Kuosmanen
 *
 *  This file is part of wfApi.
 *
 *  wfApi is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  wfApi is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with wfApi.  If not, see <http://www.gnu.org/licenses/>.
 */
'use strict';
const exrpess = require('express');
const hbs = require('hbs');
const app = exrpess();
const Cache = require('./cache');
const error = require('./error');
const fs = require('fs');
const stats = require('./stats');

// Base url and query for Warframe Wikia api.
const baseUrl = 'https://warframe.fandom.com/api.php?';
const query = 'action=query&prop=revisions&rvprop=content&rvslots=main&format=json&formatversion=2&titles=';

// The url encoded api urls for the different Wikia modules.
const wfWeaponsDataUrl = baseUrl + query + 'Module%3AWeapons%2Fdata';
const wfModsDataUrl = baseUrl + query + 'Module%3AMods%2Fdata';
const wfIconDataUrl = baseUrl + query + 'Module%3AIcon%2Fdata';
const wfVoidDataUrl = baseUrl + query + 'Module%3AVoid%2Fdata';
const wfVersionDataUrl = baseUrl + query + 'Module%3AVersion%2Fdata';
const wfWarframeDataUrl = baseUrl + query + 'Module%3AWarframes%2Fdata';
const wfWarframeConclaveDataUrl = baseUrl + query + 'Module%3AWarframes%2FConclave%2Fdata';
const wfAbilityDataUrl = baseUrl + query + 'Module%3AAbility%2Fdata';
const wfFocusDataUrl = baseUrl + query + 'Module%3AFocus%2Fdata';
const wfMissionsDataUrl = baseUrl + query + 'Module%3AMissions%2Fdata';
const wfResearchDataUrl = baseUrl + query + 'Module%3AResearch%2Fdata';
const wfArcaneDataUrl = baseUrl + query + 'Module%3AArcane%2Fdata';
const wfSyndicatesDataUrl = baseUrl + query + 'Module%3ASyndicates%2Fdata';

// The object that contains all of the cache modules and is used to generate routes.
let cache = {
  weapons: new Cache(wfWeaponsDataUrl, 'Weapons'),
  mods: new Cache(wfModsDataUrl, 'Mods'),
  icon: new Cache(wfIconDataUrl, 'Icon'),
  void: new Cache(wfVoidDataUrl, 'Void'),
  version: new Cache(wfVersionDataUrl, 'Version'),
  warframes: new Cache(wfWarframeDataUrl, 'Warframes'),
  warframesConclave: new Cache(wfWarframeConclaveDataUrl, 'Warframes/Conclave'),
  ability: new Cache(wfAbilityDataUrl, 'Ability'),
  focus: new Cache(wfFocusDataUrl, 'Focus'),
  missions: new Cache(wfMissionsDataUrl, 'Missions'),
  research: new Cache(wfResearchDataUrl, 'Research'),
  arcane: new Cache(wfArcaneDataUrl, 'Arcane'),
  syndicates: new Cache(wfSyndicatesDataUrl, 'Syndicates')
};

// Get the latest git commit short hash.
const version = require('child_process')
  .execSync('git rev-parse --short HEAD')
  .toString().trim();

// Stats recording
let statManager = new stats.StatManager();
statManager.registerStat('Requests', 'smh');
statManager.registerStat('Meta Requests', 'smh');
statManager.registerStat('Data Requests', 'smh');
statManager.registerStat('Errors', 'smh');

// Set response headers for all of the routes.
app.use(function (req, res, next) {
  statManager.hit('Requests');
  res.setHeader('X-Api-Version', version);
  next();
});

/**
 * Get the middleware for specific cache module.
 * @param which Cache module
 * @returns {Function} Express middleware
 */
function cacheRequest (which) {
  return function (req, res, next) {
    statManager.hit('Data Requests');
    which.get()
      .then(data => {
        return res.status(200).json(data);
      })
      .catch(err => {
        return next(err);
      });
  };
}

/**
 * Get the meta middleware for specific cache module
 * @param which Cache module
 * @returns {Function} Express middleware
 */
function cacheMeta (which) {
  return function (req, res, next) {
    statManager.hit('Meta Requests');
    which.getMeta()
      .then(data => {
        return res.status(200).json(data);
      })
      .catch(err => {
        return next(err);
      });
  };
}

// Create the routes.
for (let key in cache) {
  if (!cache.hasOwnProperty(key)) {
    continue;
  }
  app.get('/' + key + '-wiki', cacheRequest(cache[key]));
  app.get('/' + key + '-wiki/meta', cacheMeta(cache[key]));
}

// Use handlebars view engine to show index page
let indexHbs = hbs.compile(fs.readFileSync('./index.hbs').toString());

let apiUrls = [];
for (let key in cache) {
  if (!cache.hasOwnProperty(key)) {
    continue;
  }
  apiUrls.push({
    url: '/' + key + '-wiki',
    module: 'Module:' + cache[key].name + '/data'
  });
}

app.use('/', function (req, res, next) {
  if (req.originalUrl !== '/') {
    return next();
  }
  // Recompile the page when running in development environment
  if (process.env.NODE_ENV === 'development') {
    indexHbs = hbs.compile(fs.readFileSync('./index.hbs').toString());
  }
  return res.send(indexHbs({
    apiUrls: apiUrls,
    stats: statManager.getArray()
  }));
});

// Serve the ./static folder for the idex page style and robots.txt
app.use('/', exrpess.static('./static'));

// Route not found handler.
app.use(function (req, res, next) {
  next(new Error('404'));
});

// Final error handler.
app.use(function (err, req, res, next) {
  statManager.hit('Errors');
  let status = 500;
  if (err.message === '404') {
    status = 404;
  }
  err = error.normalizeError(err);
  return res.status(status).json({error: err});
});

app.listen('8090');
