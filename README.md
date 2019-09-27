<h1 align="center">Chatterbox 0.1.5</h1>

### @jujuadams

*A big thank you to Els White and Jukio Kallio for helping me test and develop this library.*

Chatterbox is a GameMaker implementation of the [Yarn language](https://github.com/YarnSpinnerTool/YarnSpinner), used in games such as [Far From Noise](https://www.georgebatchelor.com/farfromnoise), [Kinghts and Bikes](https://foamswordgames.com/#knights), and [Night In The Woods](http://www.nightinthewoods.com/).

Yarn is designed to be accessible to writers who have little or no programming knowledge. It makes no assumptions about how your game presents dialogue to the player, or about how the player chooses their responses. Yarn has lots of [thorough documentation](https://github.com/YarnSpinnerTool/YarnSpinner/blob/master/Documentation/YarnSpinner-Dialogue/README.md).

Syntax and features specific to Chatterbox [can be found here](https://raw.githubusercontent.com/JujuAdams/Chatterbox/master/scripts/__chatterbox_syntax/__chatterbox_syntax.gml). Chatterbox attempts to be a full implementation of the [Yarn specification](https://github.com/YarnSpinnerTool/YarnSpinner/blob/master/Documentation/YarnSpinner-Dialogue/General-Usage.md).

Yarn files can be written by hand, but the best way to start with Yarn is to use an editor. The [Yarn Spinner]() tool is available as a [web-based editor](https://github.com/YarnSpinnerTool/YarnEditor) or as binaries that you can run offline on your machine. [Windows and MacOS](https://github.com/blurymind/Yarn/releases/tag/0.3.6) are supported.

&nbsp;

**How do I import chatterbox into my game?**

GameMaker Studio 2.2.3 allows you to import assets, including scripts and shaders, directly into your project via the "Local Package" system. From the [Releases](https://github.com/JujuAdams/chatterbox/releases/) tab for this repo, download the .yymp file for the latest version. In the GMS2 IDE, load up your project and click on "Tools" on the main window toolbar. Select "Import Local Package" from the drop-down menu then import all scripts from the package.
