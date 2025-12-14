class_name Data
extends Resource
## Contain data to save and load.

## Current amount of stardust available.
@export var stardust : int = 0

## Current amount of consciouness cores available.
@export var consciouness_core : int = 1

## Upgrade 01 Clicker Upgrade Level.
@export var up_01_clicker_level : int = 0

## Upgrade 01 Generator Upgrade Level.
@export var up_01_generator_level : int = 1

## Upgrade 02 Generator Upgrade Level.
@export var up_02_generator_level : int = 0

## Contain CCUpgrades data to save and load.
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()

## Contains Universe data to save and load.
@export var universe : DataUniverse = DataUniverse.new()
