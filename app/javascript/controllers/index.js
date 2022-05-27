// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller.js"
application.register("address-autocomplete", AddressAutocompleteController)

import CardController from "./card_controller.js"
application.register("card", CardController)

import DurationController from "./duration_controller.js"
application.register("duration", DurationController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import SearchBarController from "./search_bar_controller.js"
application.register("search-bar", SearchBarController)

import StatusController from "./status_controller.js"
application.register("status", StatusController)
