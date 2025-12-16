class_name Data
extends Resource
## Contain data to save and load.

## Current amount of stardust available.
@export var stardust : int = 0

## Current amount of consciouness cores available.
@export var consciouness_core : int = 20

## Contain CCUpgrades data to save and load.
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()

## Contains Universe data to save and load.
@export var universe : DataUniverse = DataUniverse.new()
