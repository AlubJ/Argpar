<h1 align="center">Argpar 1.0.0</h1>

<p align="center">Command line argument parser for GameMaker LTS2026 by <a href="https://alub.dev/" target="_blank">Alun Jones</a>.</p>

<!---------------------------------[ Buttons ]---------------------------------->

<div align = center>

[![Badge License]][License]   [![Badge Download]][Download]

</div>

<!---------------------------------------------------------------------------->

[License]: License
[Download]: https://github.com/AlubJ/Argpar/release/latest
[Documentation]: https://docs.alub.dev/Argpar


<!---------------------------------[ Badges ]---------------------------------->

[Badge License]: https://img.shields.io/badge/License-MIT-blue
[Badge Download]: https://img.shields.io/badge/Download-.yymps-red
[Badge Documentation]: https://img.shields.io/badge/Read%20the-Docs-purple

<!---------------------------------[ Content ]---------------------------------->

---

Argpar is a command line argument parser for GameMaker LTS2026, and can parse arguments passed in through the command line or through the `game_change()` function.

# How do I use this?
Easy! Firstly, import the `.yymps` file into your project and include all files. From there you can start using the functions. You should register all the command parameters before your game runs, either through the create event of your initialisation object or through a startup script.

## Registering arguments
`ArgparRegister(name, [aliases], [types], [default])` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This function will register a new argument for the parser to use.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | `String` | The name identification for the parameter. Set to `"default"` to return the first instance without a parameter string for example, command file loading. |
| `[aliases]` | `Array.String` | The aliases to use for the parameter. |
| `[types]` | `Array.Id.Type` | The additional parameter types to use for the parameter. (`ty_string`, `ty_real`, `undefined`). |
| `[default]` | `Array.Any` | The default values that is used when the parameter is not set. |

#### **Example**

```js
// A simple flag parameter ("--debug")
ArgparRegister("debug", [  ], [  ], [ false ]);

// A default string getter ("path/to/my/file.txt")
ArgparRegister("default", [  ], [ ty_string ], [ "" ]);

// A resolution parameter ("--resolution 1920 1080")
ArgparRegister("resolution", [ "res" ], [ ty_real, ty_real ], [ 1366, 768 ]);
```

<!-- tabs:end -->

## Parsing arguments
`ArgparParse()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This function will parse the parameters passed in using the registered parameters and skip any unknown parameters.

#### **Example**

```js
ArgparParse();
```

<!-- tabs:end -->

## Getting arguments
`ArgparGet(name)` ➜ `Any`

<!-- tabs:start -->

#### **Description**

This function will get the parsed arguments from the parameters passed in.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | `String` | The name identification for the parameter to get. |

#### **Example**

```js
// In this instance, since we only registered a flag, it only returns back whether it is set or not
global.debug = ArgparGet("debug"); // global.debug == true / false

// In this instance, we registered the "default" parameter to only have one argument, it will only return the one
global.file = ArgparGet("default"); // global.file == "path/to/some/file.txt"

// In this instance, we registered the "resolution" parameter to have two arguments, thus it will return an array of two reals
global.resolution = ArgparGet("resolution"); // global.resolution == [ 1920, 1080 ]
```

<!-- tabs:end -->

## Changing the argument prefix
You may want to use your own prefix for arguments, by default it is set to `--` but can be changed in `__ArgparConfig` to whatever you want.