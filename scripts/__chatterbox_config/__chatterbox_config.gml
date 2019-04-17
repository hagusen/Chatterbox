//  Chatterbox v0.0.7
//  2019/04/15
//  @jujuadams
//  With thanks to Els White
//  
//  https://github.com/thesecretlab/YarnSpinner/blob/master/Documentation/YarnSpinner-Dialogue/Yarn-Syntax.md
//  
//  For use with Scribble v4.5.1 - https://github.com/GameMakerDiscord/scribble

#macro CHATTERBOX_OPTION_DEFAULT_TEXT  "..."
#macro CHATTERBOX_TAB_INDENT_SIZE      4
#macro CHATTERBOX_ROUND_UP_INDENTS     true
#macro CHATTERBOX_DEFAULT_STEP_SIZE    SCRIBBLE_DEFAULT_STEP_SIZE  //The default step size. "(delta_time/16667)" assumes that the game is running at 60FPS and will delta time effects accordingly

#region Automatic helper behaviours

//Fading
#macro CHATTERBOX_SKIP_FADE_ON_SELECT             true
#macro CHATTERBOX_SINGLETON_TEXT                  true
#macro CHATTERBOX_FADING_OPTIONS_NO_HIGHLIGHT     true
#macro CHATTERBOX_FADING_OPTIONS_NO_SELECT        true
#macro CHATTERBOX_AUTO_DESTROY_FADED_OUT_TEXT     true
#macro CHATTERBOX_AUTO_DESTROY_FADED_OUT_OPTIONS  true

#endregion

#region Default parameters for scribble_draw() calls made by Chatterbox

//These values can be overwritten by chatterbox_set_property() whenever needed in realtime
//Values are read every frame and can be changed for dynamic effects
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_XSCALE     1
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_YSCALE     1
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_ANGLE      0
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_BLEND      c_white
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_ALPHA      1
#macro CHATTERBOX_TEXT_DRAW_DEFAULT_PMA        false

#macro CHATTERBOX_OPTION_DRAW_DEFAULT_XSCALE     1
#macro CHATTERBOX_OPTION_DRAW_DEFAULT_YSCALE     1
#macro CHATTERBOX_OPTION_DRAW_DEFAULT_ANGLE      0
#macro CHATTERBOX_OPTION_DRAW_DEFAULT_BLEND      c_white
#macro CHATTERBOX_OPTION_DRAW_DEFAULT_ALPHA      1
#macro CHATTERBOX_OPTION_DRAW_DEFAULT_PMA        false

#endregion

#region Variables and scoping

//Supported variable prefixes for if-statements:
// 
// <<if $variable == 42>>          :  CHATTERBOX_DOLLAR_VARIABLE_SCOPE
// <<if variable == 42>>           :  CHATTERBOX_NAKED_VARIABLE_SCOPE
// <<if global.variable == 42>>    :  Global GML scope
// <<if g.variable == 42>>         :  Global GML scope
// <<if local.variable == 42>>     :  Local GML (instance) scope
// <<if l.variable == 42>>         :  Local GML (instance) scope
// <<if internal.variable == 42>>  :  Internal Chatterbox variable
// <<if i.variable == 42>>         :  Internal Chatterbox variable
//
#macro CHATTERBOX_SCOPE_INTERNAL    0
#macro CHATTERBOX_SCOPE_GML_LOCAL   1
#macro CHATTERBOX_SCOPE_GML_GLOBAL  2
//
// Internal Chatterbox variables are, in reality, key:value pairs in a ds_map
// Use chatterbox_variable_export() and chatterbox_variable_import() to handle these variables
// 
// The $ prefix is what's specified in the Yarn documentation

#macro CHATTERBOX_DOLLAR_VARIABLE_SCOPE        CHATTERBOX_SCOPE_INTERNAL    //If a variable starts if a $, what scope should it take?
#macro CHATTERBOX_NAKED_VARIABLE_SCOPE         CHATTERBOX_SCOPE_GML_LOCAL   //If a variable has no prefix, what scope should it take?
#macro CHATTERBOX_DEFAULT_VARIABLE_VALUE       0                            //Default value if a variable cannot be found
#macro CHATTERBOX_INTERNAL_VARIABLE_MAP_SCOPE  CHATTERBOX_SCOPE_GML_GLOBAL  //Are internal variables stored locally in each individual Chatterbox, or globally?

#endregion

#macro CHATTERBOX_STATE_SUSPENDED  -1
#macro CHATTERBOX_STATE_STOPPED     0
#macro CHATTERBOX_STATE_RUNNING     1

//Debug assistance
#macro CHATTERBOX_DEBUG                         false
#macro CHATTERBOX_DEBUG_PARSER                  false  //Spits out debug info for the file parser
#macro CHATTERBOX_DEBUG_VM                      false  //Spits out debug info for the virtual machine
#macro CHATTERBOX_ERROR_ON_MISSING_VARIABLE     false  //Throw an error if a variable (in any scope) is missing
#macro CHATTERBOX_ERROR_ON_INVALID_DATATYPE     true   //Throw an error when a variable returns a datatype that's unsupported (usually arrays)
#macro CHATTERBOX_ERROR_ON_MISMATCHED_DATATYPE  false  //Throw an error when two values of different datatypes are being compared

//These variables control which delimiters to use for [[options]] and <<actions>>
//For compatibility with Yarn editors you probably don't want to change these
#macro CHATTERBOX_OPTION_OPEN_DELIMITER   "["
#macro CHATTERBOX_OPTION_CLOSE_DELIMITER  "]"
#macro CHATTERBOX_ACTION_OPEN_DELIMITER   "<"
#macro CHATTERBOX_ACTION_CLOSE_DELIMITER  ">"
#macro CHATTERBOX_FILENAME_SEPARATOR      ":"

enum CHATTERBOX_PROPERTY
{
    X,              // 0
    Y,              // 1
    XY,             // 2  Changing this value also changes .X and .Y
    XSCALE,         // 3
    YSCALE,         // 4
    XY_SCALE,       // 5  Changing this value also changes .XSCALE and .YSCALE
    ANGLE,          // 6
    BLEND,          // 7
    ALPHA,          // 8
    PMA,            // 9  Premultiply alpha
    HIGHLIGHTABLE,  //10
    SELECTABLE,     //11
                  
    __SECTION0,     //12  -- Read-Only Properties --
    ITERATION,      //13
    WIDTH,          //14
    HEIGHT,         //15
    SCRIBBLE,       //16
    IS_OPTION,      //17
    HIGHLIGHTED,    //18
    __INSTRUCTION0, //19  //Internal property used for the virtual machine
    __INSTRUCTION1, //20  //Internal property used for the virtual machine
                  
    __SIZE          //21
}