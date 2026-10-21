# DEADCRAFT
Open-world block survival set in 2010, after the outbreak. Infinite seeded worlds with cities, towns and farms, freeways, forests, deserts, beaches, and about 300 blocks of underground to mine.

During the day you scavenge. At night the horde comes out, and if zombies **see light** they rush you and tear through anything in their way.

## Two HTML files
- **`index.html`** is the whole game packed into ONE file (code, textures, models, sounds, mods). This is what GitHub Pages opens, and it works even if the folders never upload. Double-click it to play offline too.
- **`dev.html`** is the editing version. It reads straight from the folders, so your texture/code changes show up instantly. Open it with **`Play DeadCraft.bat`**.
- **After you edit textures or code:** double-click **`Rebuild index.bat`** (or run `python tools/build_single.py`, or ask Claude) to rebuild `index.html`. Then upload the new `index.html`.

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

## v0.28 notes: tool swings, 2-tall fridge, stair rails, elevator breakdowns, Paint + Traffic tabs
- **Axe and machete** face the right way in your hand now (the blade points forward), and the **machete is longer**.
- **Real swings:** the machete does a fast diagonal slash, axes / pickaxes / shovels chop down. Swings are quicker (machete fastest) and the machete attacks faster too.
- **Tool icons** are pictures of the 3D tools now (no more broken-looking pickaxe).
- **Gas pump:** the full 2-block pump shows in your hand and the inventory, and it **faces you** when you place it.
- **Cash register and stop sign** have proper 3D item pictures. A **stop sign put on the ground comes with its pole** (on top of a fence post it's just the sign, like before).
- **Fridge** is 2 blocks tall now (freezer on top), faces you, both doors swing open, and it holds **4 rows of 6** (you might find food inside). The old 1-block fridges in your worlds get their top drawn too. Paintable.
- **Handrails on stairs:** click the **side of a stair** with a Handrail: the rail stands on the very edge of that step, joins the rails next to it up the stairs and **round corners**, and only blocks that thin edge (you can still walk up the stairs, but not fall off the side). Placing a handrail on the ground works like before.
- **Elevators can be out of order** (a new chance every day): the panel says OUT OF ORDER and the doors stay shut — take the stairs. Never in the Creative Realm. Chance: `DC.elevatorBrokenChance` in `js/home.js`.
- **Creative menu:** new **Paint** tab (buckets, roller, spray cans, dyes, buckets) and **Traffic** tab (asphalt, sidewalk, road lines, arrows, wheel stops, stop signs, traffic lights, fence posts, barriers, gas pump, gates…).

## v0.27 notes: kitchen, bathroom, a real mirror, lights
- **Tables are 3D** now. Put tables next to each other (2 long, 2 x 2, any shape) and they join into one big table: the legs in the middle disappear, only the outside corners keep legs. Paintable.
- **Chairs face you** when you put them down.
- **Kitchen:** **Kitchen Sink** (oak cabinet, stainless steel double sink + faucet), **Kitchen Cabinet** (1 door) and **Kitchen Cabinet (2 doors)** with a stone counter top, **Upper Cabinet** (1 or 2 doors, hang it on a wall). Right-click to look inside — the doors swing open. They hold your stuff, and the ones you find in buildings can have food in them. All paintable.
- **Toilet:** right-click to sit, **sneak + right-click to flush**.
- **Bathroom Sink Cabinet:** oak (paintable) with a white basin and a tap, 2 doors, storage inside.
- **Bathtub:** 2 blocks long, runs away from you. Break either half and it all comes back as 1 bathtub.
- **Shower Curtain:** click a ceiling and it hangs down to the tub (or the floor). Curtains next to each other join up and go round corners (L shapes, U shapes…). You can walk through it. Paintable.
- **Shower Head:** put it on a wall about 2 blocks up. Click it (left or right) to turn the water on and off.
- **Mirror** (1 wide x 2 tall): a **real mirror** — it reflects the room and **you** (your skin, walking, sitting). The nearest mirror you're looking at is live; others look silvery. On phones it turns off when Shaders are OFF.
- **Lights:** **Ceiling Light** (a square panel hanging from the ceiling) and **Wall Light**. Left-click (or right-click) switches them off and on. Like torches, zombies see them at night.
- Everything is in Creative → Furniture. Recipes are in `js/data/home_blocks.js`. Code: `js/home.js`, `js/mirror.js`. Textures: `tools/make_v27_textures.py`.

## v0.26 notes: furniture + zombies inside buildings
- **Couch** (the old couch is now 3D): seat, back cushions and arms. Put couches side by side and they join into one long couch (arms only on the ends). It faces you when you place it. **Paint it** with the roller. **Right-click to sit** (Sneak to stand). Craft: cloth + planks (`C..` / `CCC` / `PPP`) = 2.
- **Table Lamp:** **left-click** (or right-click) switches it on and off. **Sneak + left-click** breaks it. The shade takes paint. A lit lamp lights the room — and at night zombies can see that light, just like a torch. Craft: glass / torch / iron ingot in a column.
- **End Table** (1 x 1): oak legs, an inset square on top and a drawer with a gold knob (5 slots). Paintable. Craft: `PPP` / `S.S`.
- **Nightstand:** oak, 2 drawers with gold knobs (5 slots each). Paintable. Craft: `PPP` / `PCP` / `S.S` (C = cobblestone).
- Small houses get a nightstand with a lamp by the bed and an end table with a lamp next to the couch (new worlds).
- **Zombies spawn inside buildings now** — stores, the shopping center, the hospital, police stations, houses — mostly in **dark rooms with no torch or lamp nearby**. Light a room (torch or lamp) to keep them from showing up there. Never right next to you. Numbers: `INDOOR` at the top of `js/furniture.js`.
- Code: `js/furniture.js`, `js/data/furniture_blocks.js`. Textures: `tools/make_v26_textures.py`.

## v0.25 notes: taller hospital, elevators, handrails, road arrows, 3-wide lanes
- **Hospital floors are 5 blocks high** inside now (was 3). Curtains are 4 high and hang from rods up to the ceiling.
- **2 elevators** at the back of the lobby replace the 2 staircases. They go to every floor and wheelchairs fit. Walk up and the steel doors slide open; right-click the **panel** inside and pick a floor (G, 1, 2, 3). You can press it from a wheelchair too.
- **Stairwell** in the north-east corner (in case the elevators are out): one straight flight per floor with **handrails** on both sides. Door from the hallway at the east end.
- **Handrail** (new, Creative → Furniture, or 5 iron in a ∩ = 4): a grey metal tube rail, 2 blocks tall. Put it beside stairs: rails next to each other join up, climb diagonally with the steps and turn corners. It's solid, so nobody falls off the side.
- **Elevator Door** (2 wide x 2 tall, slides open by itself) and **Elevator Panel**: build your own elevator. Put a panel in the **same spot** on every floor (same x and z), right-click it, pick a floor.
- **Hospital beds only heal with an IV drip stand within 2 blocks** of the bed. Without one you can still lie down, but health and hunger don't fill up.
- **Monitors** at the reception face you as you walk in now (and the ER ones face the waiting room).
- **Front of the hospital:** an asphalt drop-off lane under the canopy with white road arrows.
- **Road Arrow** (new item, 3 white dye = 2): aim at the asphalt in the middle of a lane — that block is the **tip** and the arrow (3 wide x 3 long) points away from you, painted on the asphalt. Break any one of its 9 blocks and the whole arrow is gone (the other 8 go back to plain asphalt).
- **Every car lane is 3 blocks wide** in new worlds: freeways (3 + 3 each way, wider sidewalks) and town main roads. City streets already were. So a road arrow centred on a lane fits exactly.
- All of this is in worlds you create from now on. If you edited the hospital in Creative, use Restore defaults.
- Arrow pictures are drawn on your `asphalt.png` by `tools/make_v25_textures.py` (run it again if you repaint the asphalt). Elevator / handrail / arrow code: `js/hospital.js`.

## v0.24 notes: the new hospital, sitting, hiding, 3D tools
- **New hospital** (in worlds you create from now on): hallways **4 wide x 3 tall** on every floor, patient rooms on both sides, a lobby with a reception desk (2 computer monitors) and waiting chairs, **2 main staircases (2 wide)** up to every floor, side fire exits, and an **EMERGENCY entrance** at the back: waiting chairs facing a small office behind **2 glass windows**. (If you edited the hospital in Creative, use Restore defaults.)
- **Patient rooms:** 2 **hospital beds**, a **light-blue curtain** between them (and half-drawn in front), an **IV drip stand** by each bed, a glossy **wall cabinet** 3 blocks up over each bed (2 rows x 4 inside, the door swings open), a bedside table with a **Med-Kit**, and a **3-drawer cabinet** (3 drawers of 5). **Wheelchairs** are parked in rooms, hallways and the lobby.
- **Hospital bed:** right-click to lie down and rest: health and hunger fill back up (at night it also sleeps you through, like a bed). Sneak to get up.
- **Hide under a bed:** **Sneak + right-click** a hospital bed or a normal bed (not a sleeping bag). You slide under it, your body is hidden, and zombies can't see or hear you, so they lose track. Look around freely. Sneak again (or Jump) to crawl out.
- **Sit:** right-click a chair (lobby, ER, anywhere). Sneak to stand up. Sneak + right-click still places a block against it.
- **Wheelchairs:** right-click to sit in one. **W** rolls forward where you look, **S** rolls back, Sneak gets you up (the wheelchair stays where you stopped). You can still fight from it.
- **Med-Kit** (replaces the medical cabinet): a small white first-aid box. Right-click to open it (4 slots). Ones in hospitals and pharmacies start with bandages and cloth. **Break it and everything stays inside**: it drops as one Med-Kit item (the red number shows how many things are in it), and when you place it again it's all still there.
- **Pharmacies** have drawer cabinets with wall cabinets above them, and Med-Kits on the counter.
- **Paint:** one roller dip now paints **20 blocks** in survival. In **Creative paint is unlimited** (the bucket and the roller never run out).
- **Pick block copies paint (Creative):** middle-click a painted block and you get that block **with its paint** (a coloured dot shows on the slot). Place it and it comes out painted. No rainbow of coloured blocks in the Creative menu needed.
- **3D tools:** pickaxes, axes, machetes and shovels (wooden, stone, iron) are real 3D models in your hand and on the ground. Colours and shapes: `js/tools3d.js`.
- New blocks in Creative → Furniture: Hospital Bed, Privacy Curtain, IV Drip Stand, Wall Cabinet, Drawer Cabinet, Wheelchair, Computer Monitor. Recipes (crafting table): curtain x4 = 6 cloth; hospital bed = 3 cloth over 3 iron; wheelchair = iron frame + cloth; Med-Kit = cloth + red dye; IV stand = 3 iron + a water bottle; wall cabinet = 5 planks; drawer cabinet = 8 planks (ring); monitor = iron + glass.
- Multiplayer: friends see you sitting / in a wheelchair, and you vanish when you hide under a bed.
- Code: `js/hospital.js` (shapes, sitting, wheelchairs, resting, hiding — numbers at the top), `js/data/hospital_blocks.js` (blocks, items, recipes), hospital layout in `js/data/buildings.js`. Textures: `tools/make_v24_textures.py`.

## v0.23 notes: wheel stops & freeway sidewalks
- **Wheel stops are centred now:** aim at the ground in the middle block of a parking space and the 2-block bar is centred there (half a block sticks into the blocks on each side), on the far side. It's one block now. (Wheel stops you placed with the old 2-block version: break and re-place them.)
- **Cars can't drive over wheel stops** — they stop right at the bar. People still walk over them.
- **Every parking lot has wheel stops** in every space (city lots and the hospital lot in all worlds; the Shopping Center and Burger Shack in new worlds).
- **Freeways:** the concrete wall along the sides is gone; there's a 2-block sidewalk on each side instead (in every world, wherever the freeway is generated).

## v0.22 notes: road & parking lines
- **Lines turn toward you** when you place them now (like logs): look north/south and the line runs north/south, look east/west and it runs east/west. Buildings you rotate turn their lines too.
- **New line pieces** (Creative → Blocks, white and yellow): **Line T** (a line across with a branch going away from you — for joining parking-space lines to the main line), **Line End** (runs away from you and stops in the middle of the block), **Line Corner** and **Line Cross**.
- **Parking lots redone** like your hand-made one: solid stall lines, a centre line through each double row, crossings, Ts at the outside ends and Line Ends at every tip. City parking lots and the hospital lot change in every world (your own edits stay); the Shopping Center and Burger Shack lots are in new worlds (or Restore defaults if you edited them).
- **Wheel Stop** (Creative → Items & Tools): a 2-block concrete parking bumper, 0.3 × 0.3 with sloped sides. Paint it with the roller.
- All line textures are redrawn on your new black asphalt. If you change `asphalt.png` again, run `python tools/make_v22_lines.py` (and `tools/make_v25_textures.py` for the road arrows) and then **Rebuild index.bat** so the lines match.

## v0.21 notes:
- **Options → Buildings…** lists every building that will spawn in the **next world you create**. Tap **Edit** to change its name, type (where it spawns), front door side, how often it spawns (1–10), or switch it **off** for new worlds. Also Import, Export all, Restore defaults. Old worlds don't change.
- **Export building file**: in Options → Buildings → Edit (and in Creative → Buildings → Edit) you can save a building as a `.building.json` file. Send it to a friend, or attach it in a chat with Claude so Claude can read your build. Import puts it back in.
- **Creative → Stores** tab with the **11 11 Store Banner**. Right-click a wall to hang it: it covers 4 blocks wide × 2 tall, sits flat on the wall like it's painted on, and pops out a little like the items in your hand. Transparent parts of the picture are see-through. Break any part to take it down (in survival you get it back). Banners you save inside a building keep their picture and turn with the building.
- **Your own banner picture:** make a PNG in Photoshop with a transparent background, 2 wide : 1 tall (the same shape as the banner: 4×2 → 512×256, 6×3 → 768×384, 12×6 → 1024×512), and save it over its file in `textures/stores/` (e.g. `11_11.png`). `dev.html` shows it right away; for `index.html` run `python tools/build_single.py` again.
- **Breaking banners works now:** aim at any part of a banner and mine it; the whole banner comes down.
- **12 more store banners** (Creative → Stores): Corner Store, Pharmacy, Diner, Gas & Go, Burger Shack (6 × 3) and the Shopping Center stores Dollar, Fiver, Barber, Nails, Wok, Busway (12 × 6) and MegaMart (18 × 6). The 11 11 stays 4 × 2.
- **The stores wear their banners** in new worlds: the Corner Store, Pharmacy and Diner are a bit taller with a sign on the roof, the Gas Station has one on the front of the canopy, the Burger Shack over its windows, and the Shopping Center stores use banners instead of block letters. If you edited one of these in Creative, use Restore defaults to get the new version.
- Banner pictures are drawn by `tools/make_v21_banners.py` (it never overwrites a picture you replaced).
- **More stores:** put another PNG in `textures/stores/` and add a line to `js/data/stores.js` (add to the end of the list).

## v0.20 notes:
- New **Chair** block (Furniture tab, or craft 2 from planks + sticks on a crafting table: `P..` / `PPP` / `S.S`). Black metal legs, a seat and a tall back; it faces you when you place it.
- Paint chairs with the roller: the seat and back change colour, the legs stay black. Unpainted chairs are black.
- Hospitals: the blue couches are gone. The lobby has 2 waiting areas, each a row of 5 black chairs with 5 more behind, facing the reception desk.
- Burger Shack, Wok and Busway: red chairs round the tables instead of couches. The nail salon gets pink ones.
- Only new worlds get the new buildings. If you edited a copy of these buildings in Creative, use Restore defaults.

## v0.19 notes: new hospital, police stations, shopping centers, traffic lights
- **Hospital (rebuilt):** a big blue and white hospital, 4 floors. It has white pillars, blue panels, lots of glass, sliding glass doors under a drop-off canopy, red crosses and a HOSPITAL sign tower. Inside: a lobby with reception, patient rooms on every floor, and stairs. It sits between **two parks** (paths, trees, flowers) with the big parking lot in front.
- **Hospital beds are gone.** Hospitals use normal beds painted **light blue**. (Old hospital beds disappear from old worlds too.)
- **Police Station** (big, takes a 2 x 2 city block): blue pillars, a tall glass entrance and a POLICE sign. Inside: a lobby and front desk, the main office with **2 cells behind it**, a squad room, offices upstairs, and a **basement with 6 cells**. A **metal emergency door** at the back opens onto a **fenced parking lot (42 spaces)** with a large sliding gate.
- **Metal Door** (new): 6 iron ingots in 2 columns at a crafting table. **Zombies can't open or break it.**
- **Shopping Centers** (huge, a 6 x 3 city block, about 230 x 105 blocks): a big parking lot with trees, then **MegaMart** (supermarket: checkouts, 13 aisles, a wall of drinks fridges) plus **Dollar, Fiver, Barber, Nails, Wok (Chinese food) and Busway** (sandwiches). Each store has its own colour and a block-letter sign. Mostly concrete.
- **Traffic lights** on every city street corner (north-south and east-west take turns: green, yellow, red). **Stop signs** at the town crossings. You can place both yourself (traffic light / stop sign on top of a fence post).
- Shop signs use a block-letter font: `b.text(...)` in `js/structures.js`. Tweak how often shopping centers / police stations appear in `siteOfCell` in `js/worldgen.js`, and the light timings in `js/traffic.js`.
- All of this is in worlds you create from now on.

## v0.18 notes: city makeover, gas station, Burger Shack, shiny cars
- **City streets are 4 lanes** (2 each way): white lane dashes, a yellow centre line and zebra crossings at every intersection.
- **The hospital has a real parking lot**: 2 rows of marked spaces, a wide aisle, and a driveway out to the town's main road. The ambulances / cop cars park in the spaces.
- **New gas station** (24 x 24): one long pump island with a 4-wide lane on each side and 4 blocks of headroom, so you can drive through. The shop has 5 aisles of shelves, drinks fridges along the back wall, and a counter you can walk behind.
- **Cash registers are 3D** and sit on top of the counters (11 11s, corner store, pharmacy, diner, gas station).
- **Burger Shack** (new): fast food with a **drive-thru**. The lane comes in on the right, runs past the pick-up window and the menu board, and goes out on the left. Inside are booths, an order counter, the kitchen and drinks fridges.
- **Cars** have glossy paint (a sun highlight + a sheen, gone at night) and round wheels.
- **Spray paint:** craft a paint bucket + an iron ingot = a **Spray Paint** can of that colour. Right-click a car with it to paint the whole car (1 can = 1 car).
- **Your hand** sits like Minecraft's now (up from the bottom-right corner, leaning toward the crosshair). Held items are a bit lower / further right, and every item is **2 pixels thick** so it looks properly 3D.
- The street / parking / building changes are in worlds you create from now on (old worlds keep their layout).

## v0.17 notes: store shelves, drinks fridges, sodas
- **Store shelves open like a chest.** Right-click one to get 3 rows of 5 slots. Take things, or stock it yourself. Whatever's in a shelf stands on its boards, on both sides of the aisle.
- **Drinks Fridge** (new, 2 blocks tall, glass door): right-click it and the door swings open, with 6 rows of 8 slots. You can see the drinks through the glass. 11 11s have a row of them along the back wall.
- **New items:** Cookies, Water Bottle, and three sodas: **Loca Soda**, **Orange Soda** and **Limon Skirt**. A soda gives a **sugar rush: 2x speed for 3 minutes**, and your field of view goes up by 10 while it lasts. A timer shows at the top of the screen. You can drink a soda even when you're full.
- **Store loot is rare.** A whole 11 11s usually has 2-3 things, sometimes up to 8, and about 1 in 5 has been picked clean. Break a shelf or fridge and whatever's inside falls out. Tweak `LOOT` / `STORE_LUCK` in `js/containers.js`.
- **11 11s are at least a mile apart** now (in worlds you create from now on).
- **Creative → Buildings → Edit** opens the building's info first (name, type, front door, how often it spawns). **Edit blocks…** spawns it so you can change the blocks.
- Textures: `textures/blocks/store_shelf_back.png`, `store_fridge_*.png` and `textures/items/loca_soda.png` etc. (made by `tools/make_v17_textures.py`; you can paint over them).

## v0.15 notes: slabs, fence posts, connected glass, pick block
- **Renamed:** Asphalt Shingle Block is now **Shingle Block** and Asphalt Shingles (the stairs) are now **Shingle Stairs**. Shingle Blocks drop themselves when you break them.
- **Shingle Slab:** half a shingle block. Click the top half of a wall (or a ceiling) to get an upside-down slab. Put a slab on the open side of another slab and they become a full Shingle Block.
  Craft: coal + cobblestone diagonally in a 2x2 = 2 Shingle Blocks. 3 Shingle Blocks in a row = 6 slabs.
- **Fence Post:** a 2-block-tall metal pole, 0.3 wide. Put one where two wire fences meet to make a clean corner. Craft: 3 iron ingots in a column (crafting table) = 2 posts.
- **Ladders are thin now.** Your crosshair only hits the ladder itself, so you can mine the block above you while you're climbing. Slabs and posts only highlight the part that's really there.
- **Connected glass:** glass blocks next to each other lose the frame between them, like the Connected Textures mod, so long windows look like one big pane.
- **Pick block (middle click):** if the block is already on your hotbar, it selects it. In Creative it puts the block in your current slot. In Survival it swaps it into your current slot from your inventory.
  On iPhone there's a small **PICK** button at the top left. Turn it off in **Options → Pick block button**.
- **Options → Colours…** has every colour setting on its own page: hunger, hearts, and the new **hotbar selector** colour.
- Stairs, slabs and posts now look like their real 3D shape in your hand and on the ground (they used to show as a big flat square).

## Multiplayer (v0.14): play with friends
Works on your GitHub Pages link, on PC and iPhone, no server needed. The host's browser *is* the server.

**Host (you):**
1. **Play**, then open or create a world.
2. Pause (Esc, or the pause button on iPhone) and tap **Host Game**.
3. You get a 5-letter **invite code** like `K7M2Q`. Tap **Copy invite link** (or **Share…** on iPhone) and send it to your friend.
4. Keep playing. Friends who join show up in the pause menu. **Stop hosting** turns it back into singleplayer.

**Friend:**
- Open the invite link, or go to **Join a Friend** on the title screen and type the code. You spawn next to the host.

**What's shared:** every block anyone places or breaks (doors, paint, gates and falling trees too), player positions with name tags and skins, the zombies (the host runs them and they hunt whoever is closest), the time of day, damage, and zombie kills.
**What isn't shared yet:** dropped items and loot (whoever breaks it gets it), cars (each player has their own), and sleeping. Only the host can skip the night.

- Each friend's inventory is saved on their own device, so they keep their stuff when they rejoin your world.
- The world only runs while the host is in it. If the host quits, everyone goes back to the title screen.
- Pausing doesn't freeze the game while friends are playing.
- Both players need the same version, so re-upload `index.html` and have friends refresh.
- On iPhone, keep DeadCraft open on screen while you host. If you switch apps, Safari pauses it and friends get disconnected.
- Players find each other through the free PeerJS service (`js/lib/peerjs.min.js`), which needs internet. After that, game data goes straight between your devices. Settings and code are in `js/net.js`.

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
| **Store banners (pictures + list of stores)** | `textures/stores/` and `js/data/stores.js` |
| **Creative Realm & Creative menu** | `js/creative.js` |
| **Default key bindings** | `js/keys.js` (players can change them in Options → Controls) |
| **Day length, zombie counts & speed, sea level, building on/off** | `DC.config` at the top of `js/core.js` |
| **World generation** (cities, roads, biomes, caves, ores) | `js/worldgen.js` |
| **Zombie behaviour** | `js/entities.js` |
| **Multiplayer** (max players, send rates) | `js/net.js` |
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

## v0.13 notes: sliding glass doors, punch, 3D items
- **Sliding glass doors** (2 wide x 2 tall). The 11 11s and gas station shops use them now instead of oak doors.
  Walk up to one (or a zombie does) and the two halves slide apart into the walls; they shut 2 s after nobody's near.
  Craft: 4 glass on top + 2 iron ingots underneath (crafting table). Tweak `DOOR_RANGE`, `DOOR_STAY`, `DOOR_SLIDE` in `js/gates.js`.
  Only new worlds get the new shop buildings.
- Punch: the arm stays anchored at the bottom of the screen and swings from ~110° to ~70°. Tweak `ARM` / `PUNCH_RZ` in `js/viewmodel.js`.
- Items in hand / on the ground are 1 pixel thick with darker edges, like Minecraft.

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
