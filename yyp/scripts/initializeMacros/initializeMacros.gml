///@function initializeMacros()
///@description Insert macros here.
function initializeMacros() {

	#region Lang
	#macro debugger var __debugger__ = "breakpoint"
	#macro null undefined
	#macro ziobro 0.0
	#macro sasin 70000000.0
	#macro this id
	
	#endregion
	
	#region Common
	#macro GAME_FPS 60
	#macro FRAME_MS 1.0 / GAME_FPS
	#macro MAX_NUMBER 2147483647.0
	#endregion
	
	#region cast
	#macro Instance 800401
	#macro Entity 800402
	#macro Integer 800403
	#macro Number 800404
	#macro String 800405
	#macro Boolean 800406
	#macro any 800407
	#macro Primitive 800408
	#macro Collection 800409
	#macro JsonString 800410
	#macro Type 900450
	#endregion
	
	#region MPGrid
	#macro MP_GRID_EMPTY 0
	#macro MP_GRID_OCCUPIED -1
	#endregion
	
	#region DataStructureType
		///@implements {IterableCollection}
	#macro Array 0
	
		///@implements {IterableCollection}
		//#macro ArrayMap is defined in entites
	
	#macro Grid ds_type_grid
	
		///@implements {IterableCollection}
	#macro List ds_type_list
	
		///@implements {IterableCollection}
	#macro Map ds_type_map
	
	#macro PriorityQueue ds_type_priority
	#macro Queue ds_type_queue
	#macro Stack ds_type_stack
	#endregion
	
	#region AssetType
	#macro AssetFont asset_font
	#macro AssetClass asset_object
	#macro AssetPath asset_path
	#macro AssetRoom asset_room
	#macro AssetScript asset_script
	#macro AssetShader asset_shader
	#macro AssetSound asset_sound
	#macro AssetTexture asset_sprite
	#macro AssetTiles asset_tiles
	#macro AssetTimeline asset_timeline
	#macro AssetUnknown asset_unknown
	#endregion
	
	#region Color
	#macro COLOR_WHITE			[ 1.0, 1.0, 1.0, 1.0 ]
	#macro COLOR_BLACK			[ 0.0, 0.0, 0.0, 1.0 ]
	#macro COLOR_RED			[ 1.0, 0.0, 0.0, 1.0 ]
	#macro COLOR_GREEN			[ 0.0, 1.0, 0.0, 1.0 ]
	#macro COLOR_BLUE			[ 0.0, 0.0, 1.0, 1.0 ]
	#macro COLOR_TRANSPARENT	[ 0.0, 0.0, 0.0, 0.0 ]
	#endregion
	
	#region Settings
	#macro SETTINGS_CONSOLE_REPOSITORY_ID "console"
	#endregion
	


}
