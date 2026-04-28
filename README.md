# Anistack - Animal Stacking Game

A physics-based animal stacking game built with Godot Engine 4.6, exported to WebAssembly.

Stack animals on top of each other and build the tallest tower without it toppling over. Each animal has its own weight and physics properties.

## Controls

| Key | Action |
|-----|--------|
| Left Arrow | Move animal left |
| Right Arrow | Move animal right |
| Space | Drop animal |

## Animals

- Gorilla
- Tiger
- Panda
- Zebra
- Giraffe

## Running Locally

Open the project in Godot 4.6:

```bash
godot project.godot
```

For the web build, serve the exported game with a local HTTP server:

```bash
python3 -m http.server 8000
```

## Tech Stack

- **Godot Engine 4.6** - Game engine
- **GDScript** - Game logic
- **GodotPhysics2D** - Physics simulation
- **WebAssembly** - Web export target

## License

All rights reserved.