# DEADCRAFT
Open-world block survival set in 2010, after the outbreak. Infinite seeded worlds with cities, towns and farms, freeways, forests, deserts, beaches, and about 300 blocks of underground to mine.

During the day you scavenge. At night the horde comes out, and if zombies **see light** they rush you and tear through anything in their way.

## Two HTML files
- **`index.html`** is the whole game packed into ONE file (code, textures, models, sounds, mods). This is what GitHub Pages opens, and it works even if the folders never upload. Double-click it to play offline too.
- **`dev.html`** is the editing version. It reads straight from the folders, so your texture/code changes show up instantly. Open it with **`Play DeadCraft.bat`**.
- **After you edit textures or code:** run `python tools/build_single.py` to rebuild `index.html`, or ask Claude to rebuild it. Then upload the new `index.html`.

## Play
- **iPhone / iPad (and Android):** open your GitHub Pages link in Safari. For full screen, tap **Share → Add to Home Screen** and launch DeadCraft from the home screen. It plays in landscape with touch controls:
  - Left thumb is the joystick. Push it all the way forward to sprint.
  - Drag the right side to look. **Tap** to place or use, **hold** to mine or attack.
  - Buttons: JUMP, HIT/FIRE, USE/AIM/EAT, SNEAK (EXIT in a car), BAG (inventory), TORCH, DROP and pause.
- **Windows:** double-click **`Play DeadCraft.bat`**. It starts a tiny local server and opens your browser. Keep the black window open while you play.
- **Online:** upload this whole folder to a GitHub repo, then go to Settings → Pages → `main` / root. Open `https://<you>.github.io/<repo>/`.
- Use Chrome or Edge with a mouse and keyboard. Double-clicking `dev.html` won't work (browsers block textures from local files), but `index.html` does.

**Controls:**

| Key | Action |
|---|---|
| WASD | Move |
| Space | Jump / climb ladders |
| R or double-tap W | Sprint (keeps sprinting until you let go of W) |
| Shift | Sneak |
| Left click | Mine / attack |
| Right click | Place / use / open crafting table |
| E | Inventory |
| 1–9 or mouse wheel | Hotbar |
| Q / Shift+Q | Drop item / drop whole stack |
| F | Move a torch to your left hand (and back) |
| Hold right click | Eat food / aim a gun |
| F3 | Debug info |
| F1 | Hide HUD |
| T | Show/hide the clock |
| Right click a car | Get in (with a Gas Can: refuel) |
| W/S · A/D · Space · Shift (in a car) | Drive · steer · brake · get out |
| Esc | Pause |

## Folder map: what to edit

| I want to change… | Edit this |
|---|---|
| **Block textures** | `textures/blocks/*.png` (16×16, or 32×32 for HD, as long as they're all the same size) |
| **Item / tool icons** | `textures/items/*.png` |
| **Your player skin** | `textures/entity/playerskin.png`: any normal Minecraft skin works (64×64, or old 64×32). Just name it `playerskin.png` |
| **Zombie skin** | `textures/entity/zombie.png` (64×64 Minecraft-style skin layout). Any **bright pure-red pixel** (like #FF0000) glows in the dark, and red pixels on the face get a glowing halo |
| **Player model** | `models/player.geo.json` (Blockbench, Bedrock format) |
| **Sound effects** | Replace any file in `sounds/` (.wav/.mp3/.ogg). The list and volumes are in `sounds/sounds.js` |
| **Guns** (damage, fire rate, auto, recoil, noise) | `js/data/items.js` (bottom) |
| **Gun models & arm positions** | `js/viewmodel.js` (`makePistol`, `makeRifle`, POSES) |
| **Food values** | `js/data/items.js` (`food:` points, 20 = full) |
| **Zombie model** | `models/zombie.geo.json` (open in **Blockbench** as a Bedrock model) |
| **UI colours / font / slot size / roundness** | `css/theme.css` |
| **Zombies-hunting-you icon** (top left) | `textures/gui/zombie_icon.png` (any size, square looks best) |
| **UI layout** | `css/ui.css`, `dev.html` |
| **Blocks** (hardness, drops, which tool…) | `js/data/blocks.js` |
| **Items & tools** (damage, durability) | `js/data/items.js` |
| **Crafting recipes** | `js/data/recipes.js` |
| **Supply crate / furniture loot** | `js/data/loot.js` |
| **The 10 default buildings** | `js/data/buildings.js` (or edit them in the Creative Realm) |
| **Building library / spawning rules** | `js/structures.js` |
| **Creative Realm & Creative menu** | `js/creative.js` |
| **Default key bindings** | `js/keys.js` (players can change them in Options → Controls) |
| **Day length, zombie counts & speed, sea level, building on/off** | `DC.config` at the top of `js/core.js` |
| **World generation** (cities, roads, biomes, caves, ores) | `js/worldgen.js` |
| **Zombie behaviour** | `js/entities.js` |
| **Cars** (speed, fuel, HP, and the box models) | `js/data/vehicles.js`. Add your own with `DC.registerVehicle` |
| **How many abandoned cars spawn** | `carChance` in `DC.config` at the top of `js/core.js` |
| **Doors, wall torches, paint rules** | `js/interact.js` |
| **Falling trees** (apple / stick chances) | `js/trees.js` |
| **Garages, driveways, house roofs** | `js/worldgen.js` (`housePlan`, `garageColumn`, `house7`) |
| **Your empty-hand arm angle** | `js/viewmodel.js` (`ARM`) |
| **Driving / refuel / car breaking** | `js/vehicles.js` |

A missing texture shows as a purple/black checkerboard, so you can see what still needs painting.
If you add new blocks, add them at the **end** of `blocks.js` so old saves stay correct.

### Editing the zombie in Blockbench
1. Open Blockbench, go to File → Open Model, and pick `models/zombie.geo.json`. Load `textures/entity/zombie.png` as its texture.
2. Change cubes and paint the skin.
3. Export with File → Export → **Export Bedrock Geometry**, overwriting `models/zombie.geo.json`. Save the texture over `zombie.png`.
4. Bones named `head`, `body`, `rightArm`, `leftArm`, `rightLeg` and `leftLeg` animate automatically.

## Making mods
1. Copy `mods/metal_barricade` to `mods/my_mod`.
2. Add `'my_mod'` to the list in `mods/mods.js`.
3. Inside `mod.js`:
```js
DC.registerMod({ name: 'My Mod', version: '1.0', description: 'What it does' });
DC.registerBlock({ name: 'spike_trap', textures: { all: DC.modPath('spikes.png') }, hardness: 2, tool: 'pickaxe', placeable: true });
DC.registerItem({ name: 'canned_beans', desc: 'Heals 2 hearts', use: 'heal', heal: 4, texture: DC.modPath('beans.png') });
DC.registerRecipe({ pattern: ['I I', ' I '], key: { I: 'iron_ingot' }, result: 'spike_trap', needsTable: true });
DC.on('nightStart', day => DC.ui.notify('Night ' + day + ' begins!'));
```
**Events you can hook:** `init`, `worldStart`, `tick`, `nightStart`, `dayStart`, `blockBreak`, `blockPlace`, `blockChanged`, `zombieSpawn`, `zombieAttack`, `zombieBreak`, `zombieKilled`, `playerDeath`, `craft`, `generateChunk` (add your own structures!).

**Console cheats for testing** (press F12 → Console):
- `DC.give('iron_machete')` gives you an item.
- `DC.game.time = 590` skips to just before nightfall.

## v0.12 notes: 11 11s, new gas stations, fenced police, HUD options, your own skin
- **Fixed:** dying while driving no longer respawns you inside the car. You fall out, and respawn at your spawn point / bed.
- **Hunger icons are red apples** now. **Options → Hunger** lets you pick red apples, oranges, watermelon, or a **bar** in any colour you like. **Heart colour** has a colour picker too ("Reset colours" puts them back).
- **Your own skin:** Options → **Upload skin…** takes any Minecraft skin PNG (64×64 or the old 64×32). It's saved on that device, and **Default skin** switches back.
- **Car top speeds:** sedan 50 mph, pickup / police / ambulance 45 mph. Crashing at 40+ mph does at least 3 hearts and 20% of the car.
- **Hitting** now throws a proper Minecraft-style punch (not a small lift of the arm).
- **New buildings** (in worlds you create from now on):
  - **11 11s**: a corner convenience store. Brick, glass front, an orange / green / red striped sign with a big red "11", aisles, drinks fridges, a coffee corner and the counter.
  - **Gas Station** redesigned like a real one: a big canopy on white pillars over 3 islands of our 2-tall pumps. Painted concrete: white walls, then a red stripe, a purple stripe and white on top. Plus a matching shop.
  - **Police Station** now has a **fenced parking lot** out back (wire fence all round) with a **large sliding gate** that opens when you drive up, and a back door.
- **Saved buildings keep paint, facing and gates** now. Anything you paint or set up in the Creative Realm and save with the Building Wand comes out the same in your survival worlds. In `js/data/buildings.js` you can use `b.paint(...)`, `b.fence(...)` and `b.gate(...)`.

## v0.11 notes: wire fences, sliding gates, real pause, build anywhere
- **Pause really pauses** now: time, zombies, cars and everything else freeze while the pause menu is open.
- **Wire Fence:** a full crafting table of iron (9 ingots). It's a chain-link panel 2 wide x 2 tall, thin like a window pane. **Zombies can't break it, climb it or jump it.** Electric fences with generators are coming later. Break any part and the whole piece comes back as 1 fence.
- **Sliding gates:**
  - **Iron Gate** (2 wide x 2 tall) = wire fence + 2 iron ingots. **Large Iron Gate** (4 wide x 2 tall) = 2 iron gates.
  - Drive up to a gate and it **slides open to the left** (left of whoever placed it), sliding over the fence next to it.
  - Place it from the other side and it opens to the right instead.
  - **5 seconds** after you're through it slides shut, **shoving zombies out of the way**. It never closes on you.
  - On foot: right-click it.
  - Settings at the top of `js/gates.js`.
- **Build anywhere:** every block can be placed in survival now (`allowBuilding` in `js/core.js`).
- **Options → Item glow:** turns the red glow around dropped items on or off.

## v0.10 notes: faster cars, car damage & explosions, 2-tall gas pumps
- **Gas pumps** are 1 wide, 2 tall: a red pump with a GAS sign, a screen, a hose and a concrete base. Older worlds' pumps get the top half drawn too.
- **Top speeds:** sedan 85 mph, pickup 75 mph, police car 90 mph, ambulance 70 mph. Change `maxSpeed` in `js/data/vehicles.js` (blocks/second, x 2.237 = mph).
- **Crashing hurts:** hitting something at 60+ mph does at least **3 hearts** to you and **20%** to the car (more the faster you go). 40-60 mph = 1.5 hearts, 10%.
- **Car health (GTA style):** the car HUD shows a health bar (green 90-100%, white 25-90%, red under 25%).
  - At 0 the engine is wrecked: it **smokes** from the hood and drives at half speed.
  - Damage it again (zombies clawing at it, crashes, smashing buildings, **bullets**) and it **catches fire**, then **explodes** about 5 seconds later.
  - The explosion hurts everyone within ~6 blocks, kills nearby zombies, sets other cars off, shatters glass and alerts every zombie around. Get out!
- **Zombies attack your car** instead of you while you're driving.
- **Car HUD:** gas is a percentage (a red **E** when empty). The HUD sits 10px above the hotbar, and the item name is hidden while you drive.
- **Fixed:** a gun no longer fires on its own when you scroll to it. Old clicks are thrown away, and if you're holding the button when you switch, let go first.

## v0.9 notes: beds, sleeping, flowers, dyes, buckets
- **Beds** are now real Minecraft-style beds: 2 blocks long, 1 wide, on little wooden legs, with a white pillow at the head. The pillow end goes away from you when you place one. You can stand on them.
- **Sleep:** right-click a bed at night. The screen fades to black and the night is skipped. A bed takes **5 seconds** to fall asleep, a **sleeping bag 15 seconds**. Sleeping also sets your respawn point.
  - You can't sleep while zombies are hunting you nearby.
  - Getting hurt wakes you up. Press sneak to get up early.
- **Cloth** turns up in supply crates, closets and garages. 6 cloth (2 columns of 3) at a crafting table makes a **sleeping bag**. 3 cloth on 3 planks makes a **bed**. Both can be painted with the roller, which changes the blanket colour.
- **Flowers** grow in patches: rose, sunflower, blue orchid, violet, orange/white/pink tulip and cornflower. Each flower crafts into **2 dye**: red, yellow, light blue, purple, orange, white, pink, blue. Other dyes: cactus = 2 green, coal = black, dirt = brown.
- **Buckets:** 3 iron ingots in a V. Right-click water to fill it. Big water (rivers, lakes, ponds of about 4x4+) flows back into the hole, like Minecraft's infinite water. Right-click the ground with a water bucket to pour it out.
- **Making paint:** water bucket in the middle of a crafting table, 8 dye of one colour around it = a **paint bucket** (32 blocks of paint, 4 per dip). New colours: light blue, orange, pink. An emptied paint bucket gives you the empty bucket back.
- **Roller:** the roller head turns the paint colour when you dip it and fades back to white as the paint runs out. Right-click water with it to wash it clean.
- **Doors:** the handle is now always on the side away from the hinges. The inside is mirrored, so it's on the left from inside.
- New textures come from `tools/make_v09_textures.py`.

## v0.8 notes: stealth, gore, smashing cars, blocks that face you
- **Speed is in mph.** Over **20 mph** your car crashes straight through glass. Near **top speed** it smashes through walls: brick, concrete, siding, drywall, furniture, doors. It never goes through the ground, stone or trees. Smashing slows you down, dents the car and is loud. Tweak `glassSmashMph` / `wallSmashAt` in `js/core.js`.
- **Road lines on east-west roads** now run along the road instead of across it.
- **Blocks face you** like Minecraft: stoves, fridges, TVs, crafting tables and wardrobes turn their front toward you. Logs and hay bales lie on their side when you place them against the side of a block.
- **Stealth:** zombies need a clear line of sight to see you now, even when you're holding a torch. Walls, floors and shut doors hide you. Getting upstairs out of sight really works.
  - Stand behind cover that's **2 blocks high** and **hold Shift (sneak)**. A purple **STEALTH** tag shows next to the hunter counter and their awareness bar drains.
  - Hiding without sneaking drains it much more slowly.
  - Walking near them on the same floor (not sneaking) lets them **hear** you. An amber **THEY HEAR YOU** tag shows.
  - Settings: `hideDrain`, `hearRange` in `js/core.js`.
- **Gore:** zombies bleed red pixel blood when hit. When they die they fall apart: head, arms, legs and body fly off and bounce. Blood **stains** the ground (grass, floors, roads…) under zombies and under you when you get hurt. Stains fade after 10 seconds (`bloodStainTime`).

## v0.7 notes: doors, paint, roofs, garages, falling trees
- **Torches** stick to the wall you click and lean out from it, like Minecraft. On the floor they're a little stick. Break the block holding a torch and the torch drops.
- **Your hand** stands up more (about 100° instead of 60°).
- **Oak doors** (6 planks in 2 columns at a crafting table = 3 doors). Place one in a doorway (2 blocks tall). Right-click to open and shut it. Sneak + right-click places blocks against it instead. **Zombies know how to open doors.** They fiddle with the handle for a second, then walk in. They can't see you through a shut door, though.
- **Paint:** find **Paint Buckets** (red, blue, green, yellow, white, black, brown, purple) in garages and supply crates. Make a **Paint Roller** from 2 wheat on top of a stick. Place a bucket, right-click it with the roller to dip it (each dip uses 1/8 of the bucket), then right-click siding, concrete, brick, drywall, doors, stairs or wooden furniture to paint it. One dip paints 16 blocks. Hold right-click to keep rolling. Break a bucket to pick it back up with its paint.
- **Oak Stairs** (6 planks in a staircase shape = 4) and **Asphalt Shingles** (coal + cobblestone = 4 black roofing stairs). Like Minecraft, stairs go up away from you.
- **Houses** in new worlds have black asphalt-shingle stair roofs and real doors. **Half of them have a garage with a concrete driveway.** Garages often have a supply crate and a paint bucket in the back.
- **Cars are 10x rarer** on the roads.
- **Car HUD:** one gas gauge with its percentage. The four little bars next to it are your tires. They turn amber when a tire is worn and red when it's flat or missing.
- **Crafting Totem:** 8 planks in a ring with cobblestone in the middle, at a crafting table. While it's in your inventory, pressing E gives you a 3x3 crafting grid anywhere.
- **Falling trees:** chop a log and everything above it (logs + leaves) tips over away from you and crashes down. You get all the logs, plus sticks and sometimes apples. The log below the cut stays as a stump.
- Old worlds keep their old towns. New houses, garages and roofs show up in worlds you create with v0.7. Every world gets the new blocks, doors, paint and falling trees.
- New textures come from `tools/make_v07_textures.py`, or you can paint over the PNGs.

## v0.6 notes: Creative Realm, your own buildings, controls, tires
### Designing building interiors (houses, hospitals, stores…)
1. **Singleplayer → Create New → Game Mode: Creative Realm.** It's a flat world: always day, no zombies, no damage, unlimited blocks. **Double-tap Jump** to fly (Jump = up, Sneak = down).
2. Press **E** (or **BAG** on iPhone) for the **Creative menu**: Blocks, **Furniture** (beds, couches, kitchen counters, stoves, fridges, TVs, desks, shelves, cash registers, medical cabinets, wallpaper, carpet…), Items, Food, Vehicles, Buildings and Props. Tap an item to put it in the highlighted hotbar slot.
3. Build your house. Include the floor. Put **supply crates**, fridges, wardrobes, store shelves and medical cabinets inside: players can break those for loot.
4. Take the **Building Wand** (first hotbar slot). **Left-click** one bottom corner (the floor), **right-click** the opposite top corner (the roof). A purple box shows the selection.
5. Press **B** (or **SAVE** on iPhone). Name it, pick the **type** (decides where it spawns), the side with the **front door** (it guesses from where you're standing) and **how often it spawns**. Save.
6. **Create a new survival world.** Your building now spawns there:
   - **House**: town plots, front door turned toward the road (max 22×22)
   - **Store / Apartment / Office**: city blocks (max 22×22)
   - **Hospital**: replaces the hospital you wake up in (any size, you spawn in the middle of the ground floor)
   - **Gas Station**: cities + towns · **Barn / Farm**: farms · **Prop**: never spawns by itself, only from the Creative menu
   Worlds copy the library when they're created, so old worlds never change under you.
7. **Creative menu → Buildings**: **Spawn** any building, **Edit** it (it spawns with the selection already set, change it, press B → *Save changes*), **Export / Import** (.json, to share between PC and iPhone, or with friends), **Delete**, and **Restore defaults**.
   10 default buildings come with the game: Small House, Two-Story House, Farmhouse, Corner Store, Pharmacy, Diner, Police Station, Apartment Block, Hospital and Gas Station. Their code is in `js/data/buildings.js`.

### Controls
**Options → Controls**: click any action, press the key or mouse button you want. Saved on that device. *Reset to defaults* undoes everything.

### Cars
- The old block cars on the highways are gone. Only real drivable cars spawn now.
- Cars crash into each other (they bounce, dent, and can wreck), and they hit you if you stand in the road.
- **Scrapping:** hit a car with a **pickaxe** (other tools just rock it). It wobbles and falls apart into **iron bars + its tires**.
- **Tires:** every car spawns with worn tires (50–70% life). They wear down as you drive and can **go flat or blow out** (more likely when old and when you're going fast). A flat makes the car slow and pull to one side. A missing tire means it barely moves. The car HUD shows each tire.
  - **Sneak + right-click** a wheel on another car to take its tire off.
  - **Right-click** your car with a **Tire** to put it on (it goes on the wheel you're looking at, or the worst one). You keep the old one if it still has life.

### iPhone
- Tapping hotbar slots works again (the touch controls were covering the hotbar).
- The inventory is a bit smaller so it fits better.

## v0.2 notes
- **Hunger:** the bar is on the right above the hotbar. Sprinting and jumping make you hungry faster. You only heal when hunger is 7 drumsticks or more, and you can't sprint at 3 or less. Hold right click to eat. Wheat makes bread (3 in a row); supply crates have cans, chips and chocolate.
- **Items drop on the floor:** they glow red and float. Walk over them to pick them up.
- **Zombies:**
  - Once a zombie starts hunting you, it keeps coming. If **none** of them can see you for 10 seconds (the white bar under the zombie counter), they lose track of you. Change it with `loseTrackTime` in `js/core.js`.
  - Zombies push each other apart, so they swarm around you instead of merging into one.
  - Hunters growl, and every zombie within 10 blocks of a growl joins the hunt.
  - Gunshots alert every zombie within 48–64 blocks.
  - Hunting zombies break blocks day and night. In daylight they break them more slowly.
- **Guns:** infinite ammo for testing. Pistol = iron ingots in a sideways L (`III` / `I..`); rifle = `III` / `PPI` (P = planks). Both need a crafting table. Headshots do double damage.

## v0.5 notes: shaders, iPhone, cartoon grass
- **Shaders (Options → Shaders):**
  - Warm sunlight with cool blue shadows on the sides of blocks.
  - Grass, wheat and leaves sway in the wind, and water ripples with sun glints.
  - Gradient sky with sunsets, a sun halo, stars and blocky clouds.
  - Fog that glows toward the sun, plus film-style colour grading and a vignette.
  - Turn shaders **OFF (fast)** on older phones. **Resolution** lowers the pixel count; the game also lowers it automatically if the frame rate drops.
- **Cartoon grass:** grass, dirt, leaves and tall grass are repainted in a bolder, Minecraft Dungeons-like style. Regenerate them with `tools/make_cartoon.py`, or just paint over the PNGs.
- **Shader code** lives in `js/render.js`, which explains each effect.

## v0.4 notes
- **You wake up in a hospital.** Ambulances and a cop car are parked out front.
- **Buildings** have staircases (walk straight up them), a corridor and separate rooms. Light now comes in through windows and doors, so rooms near windows are lit and deep inside is darker.
- **Cars:**
  - There are four kinds: sedans, pickups, abandoned police cars and ambulances. They sit on roads with a little fuel left.
  - Stop next to a **gas pump** (gas stations are in cities and towns) to refuel for free, or use a **Gas Can**.
  - Cars climb 1-block bumps, run zombies over, and their engines attract nearby zombies.
  - Hit a car with anything and it wobbles. Keep going and it breaks into **20 iron ingots**.

## Survival tips
- Punch trees to get logs. Make planks, then a crafting table, then wooden tools.
- Mine down for cobblestone, coal and iron. You need a stone pickaxe or better for iron.
- Forge iron at a crafting table: raw iron + coal makes an iron ingot.
- Coal + stick makes 4 torches. A torch in your hand lights the way, but at night it tells every zombie where you are.
- Break supply crates inside buildings for loot.
- Before dark, get inside and board up doors and windows with planks. Ladders take you up through apartments and offices to the roof.
