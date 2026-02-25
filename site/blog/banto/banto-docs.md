# Bantō — Knowledge Base

> A comprehensive reference document about Bantō: what it is, why it was built, how it works, and how to use it.

---

## What Is Bantō?

Bantō is a minimal, responsive, browser-based Kanban board built for personal productivity. It requires no account, no server, no database, and no framework. Open it in a browser, start organizing, and everything saves itself automatically.

The name *Bantō* (番頭) is a Japanese word for a manager or head clerk — a nod to the app's purpose: keeping your tasks in order, quietly and reliably.

It was created by Erik Schütze and lives at [banto.erik-schuetze.dev](https://banto.erik-schuetze.dev). The source code is MIT-licensed and available on GitHub at [github.com/Erik-Schuetze/banto](https://github.com/Erik-Schuetze/banto).

---

## The Idea & Philosophy

Bantō was built for homelabs, personal productivity, and anyone who wants a simple Kanban board without the bloat.

Most task management tools are either too heavy (Jira, Linear, Notion) or require an account and sync infrastructure. Bantō takes a different approach:

- **Zero dependencies** — No npm, no bundler, no framework. Pure HTML, CSS, and vanilla JavaScript.
- **Zero backend** — Everything lives in the browser's `localStorage`. No login, no cloud, no tracking.
- **Zero friction** — Open the page, click to edit, drag to rearrange. Done.
- **Self-hostable** — Drop the `site/` folder anywhere, or run it in a Docker container with a single command.

The design philosophy is: *do one thing well*. Bantō is a Kanban board. It manages columns and cards. That's it.

---

## Features

### Core Board Functionality

- **Columns** — Create, rename, delete, and drag to reorder columns. Columns are the backbone of the board. A default board ships with "To Do", "In Progress", and "Done" columns.
- **Cards (Items)** — Each card has a **title** and a **notes/description** field. Cards can be added to any column, deleted, completed, and freely dragged between columns.
- **Inline Editing** — Click any column title, card title, or card notes to edit directly in place. Press `Enter` to save, `Shift+Enter` to insert a new line. No modal dialogs, no forms.
- **Completion Tracking** — Click the ✔ button on any card to toggle it as complete. Completed cards get a strikethrough title and a persistent green checkmark.
- **Drag & Drop** — Full drag-and-drop support for both cards and columns. A horizontal line shows where a card will land; a vertical line shows where a column will be inserted.

### History & Undo/Redo

- **Undo / Redo** — Every board action (add, delete, move, edit) is recorded in a history stack. Use the `‹` and `›` buttons in the navbar, or keyboard shortcuts, to travel through history.
- **Persistent History** — The undo/redo stack is stored in `localStorage` and survives page refreshes. Pick up exactly where you left off.
- **History Cap** — The history is capped at the 30 most recent states to keep storage usage reasonable.

### Data Persistence

- **Automatic Saving** — The board saves to `localStorage` on every interaction. There is no save button.
- **No Cloud Required** — All data stays in the user's browser. Nothing is ever sent to a server.
- **Export** — Download the board as a `.json` file at any time using the `↓` button (or `⌘S`). Useful as a backup or snapshot.
- **Import** — Restore a previously exported `.json` file using the `↑` button (or `⌘I`). Works across browsers and devices.

### Keyboard Shortcuts (Desktop)

| Shortcut | Action |
|---|---|
| `⌘ Z` / `Ctrl Z` | Undo |
| `⌘ Shift Z` / `Ctrl Shift Z` | Redo |
| `⌘ S` / `Ctrl S` | Export board as JSON |
| `⌘ I` / `Ctrl I` | Import board from JSON |

Shortcuts are automatically disabled while editing text fields to avoid conflicts.

### Mobile & Touch Support

- **Responsive Layout** — On screens ≤768px wide, columns are displayed in a horizontally scrollable strip. Each column takes up ~80vw so one is always prominently in view.
- **Long-Press Drag** — On touch devices, press and hold (200ms) a card or a column title bar to initiate a drag. A visual clone of the element follows your finger.
- **Always-Visible Controls** — On touch devices, action buttons (complete, delete) are always visible since hover states don't exist.
- **Help Button** — The "Help" label collapses to a "?" icon on small screens to save space.

### Help Modal

A built-in help overlay (accessible via the "Help" button in the navbar) explains every feature with clear, concise instructions. It can be closed by clicking the × button, clicking outside the modal, or pressing `Escape`.

### Tooltips (Desktop Only)

On devices with a fine pointer (mouse), hovering over any action button shows a tooltip after a 300ms delay. Tooltips follow the cursor and clamp to the viewport edges. They are suppressed during drag operations.

---

## How to Use Bantō

### Creating Columns

Click **"add column"** at the far right of the board. A text cursor appears — type the column name and press `Enter`. The column is created immediately and saved. Press `Escape` to cancel.

### Renaming a Column

Click directly on the column title text. It becomes editable. Type the new name and press `Enter` or click away.

### Deleting a Column

Hover over the column title. A `×` button appears on the right. Click it to delete the column and all its cards permanently. This action can be undone.

### Reordering Columns

Click and drag a column by its title bar. A vertical indicator line shows the insertion point. Release to drop. On mobile, long-press the title bar to initiate the drag.

### Adding Cards

Click the `+` button at the bottom of any column. A new card appears with default "Title" and "Description" placeholder text. Click the title or description to edit.

### Editing Cards

Click on the card title or the notes text to edit it inline. Press `Enter` to confirm, `Shift+Enter` to add a line break, or click away to save.

### Completing Cards

Hover over a card and click the **✔** button. The title gets a strikethrough and the checkmark turns green. Click again to mark it incomplete. Completion state is saved.

### Deleting Cards

Hover over a card and click the **×** button. The card is removed and the action is added to the undo history.

### Moving Cards

Click and drag a card to any position within the same column or into a different column entirely. A horizontal line indicates where the card will be inserted. On mobile, long-press to drag.

### Undo / Redo

Click `‹` (undo) or `›` (redo) in the top-right navbar. These buttons are disabled when there is nothing to undo or redo. The full history persists across browser sessions.

### Exporting Your Board

Click the `↓` button (or press `⌘S`). A `.json` file named `banto-board-YYYY-MM-DD.json` is downloaded. This is the raw board state and can be re-imported later.

### Importing a Board

Click the `↑` button (or press `⌘I`) and select a previously exported `.json` file. The current board is replaced with the imported one. The import is added to the undo history.

---

## Design

### Visual Style

Bantō uses a warm, papery aesthetic:

- **Background color:** `#efdbbf` — a warm beige/parchment tone
- **Background texture:** A subtle blue grid overlay (`rgba(27, 75, 198, 0.06)`) at 27×27px gives a grid-paper feel
- **Accent color:** `#1b4bc6` — a strong cobalt blue used for borders, buttons, and interactive highlights
- **Primary color:** `#0b162a` — near-black navy used for headings and the brand name
- **Card style:** Cards have a solid 2px blue border with a 4px offset drop shadow (`box-shadow: 4px 4px 0 #1b4bc6`), giving a flat, geometric, almost brutalist card feel
- **Danger color:** `#d32f2f` — red used for delete button hover states

### Typography

- **Logo / Brand:** [Montserrat](https://fonts.google.com/specimen/Montserrat) (700 weight) — strong geometric sans-serif, licensed OFL 1.1 by Julieta Ulanovsky
- **Body text:** [Inter](https://fonts.google.com/specimen/Inter) (400/600/700 weights) — clean, modern screen-optimized sans-serif, licensed OFL 1.1 by Rasmus Andersson
- Fonts are loaded from Google Fonts with `preconnect` hints for performance

### Layout

- The navbar is fixed to the top (5vh height) with a gradient fade-out and `backdrop-filter: blur(3px)`
- The footer is fixed to the bottom (3vh height) with the same treatment
- The main kanban area fills the remaining viewport between them, with independent scroll
- Columns use `flex: 1 1 0` so they share space equally on desktop
- The "add column" button occupies a fixed `flex: 0 0 10%` slot at the right edge

### Interaction Design

- Buttons on cards and column headers are **hidden by default** and revealed on hover (`opacity: 0` → `opacity: 1` via CSS transition) — keeping the board visually clean
- On touch devices, these buttons are always visible (`opacity: 1`) since hover doesn't exist
- Dragged elements reduce to 40–50% opacity so you can see the drop target beneath them
- Drop indicators (lines) use a subtle `rgba(36, 42, 43, 0.3)` color
- Touch drag clones rotate 2° and have a softer shadow to communicate "picked up" state

### Favicon

The favicon is an inline SVG: a white square with a bold blue border and offset blue drop shadow, containing a large bold **B**. It mirrors the card design aesthetic of the app.

---

## Technical Architecture

### Stack

| Layer | Technology |
|---|---|
| HTML | Semantic HTML5 |
| CSS | Vanilla CSS with custom properties (variables) |
| JavaScript | Vanilla ES6+ (no frameworks, no bundler) |
| Fonts | Google Fonts (Montserrat, Inter) |
| Storage | Browser `localStorage` |
| Server | Caddy (static file server) |
| Container | Docker (Caddy Alpine image) |

### JavaScript Architecture (`app.js`)

The entire application logic lives in a single `app.js` file (~1,300 lines). There are no external JS dependencies.

Key components:

**`BoardHistory` class**
Manages the undo/redo stack. Stores serialized board states as JSON strings in an array. Tracks `currentIndex` as a pointer into the array. Both the history array and current index are persisted to `localStorage` under the key `banto:history`. The stack is capped at 30 entries.

**`saveBoard(container)`**
Walks the DOM, collects all column titles and card data (title, notes, storage keys, completion state), serializes to JSON, writes to `localStorage` under `banto:board`, and adds the snapshot to `BoardHistory`.

**`loadBoard(container)` / `restoreBoardState(container, json)`**
Rebuilds the DOM from a stored JSON snapshot. Used on page load and during undo/redo.

**`createColumnElement(title, items)` / `createItemElement(itemData)`**
Programmatic DOM builders for columns and cards. Each editable text node gets a unique UUID-based `data-key` for its own `localStorage` slot.

**`ensureEditable(element)`**
Attaches `contenteditable` and event listeners (keydown, input, blur) to any editable text node. Handles saving on blur and `Enter` key.

**`setupAddColumn(container)`**
Manages the "add column" UI interaction: click to activate text entry, Enter to confirm, Escape to cancel.

**Drag & Drop (Desktop)**
Two parallel drag systems:
1. *Item drag* — Standard HTML5 `dragstart`/`dragover`/`drop`/`dragend` on the container. Uses `elementFromPoint` logic and a visual drop indicator element.
2. *Column drag* — Also HTML5 drag events, but attached in the **capture phase** (`addEventListener(..., true)`) to intercept events before the item drag handler. Uses CSS `::before`/`::after` pseudo-elements for the drop indicator line.

**Touch Drag (Mobile)**
Two parallel touch systems (only initialized when `"ontouchstart" in window`):
1. *`setupTouchItemDrag`* — Long-press (200ms) to lift a card, `touchmove` to drag a clone, `touchend` to drop.
2. *`setupTouchColumnDrag`* — Same pattern for columns.

Both use `document.elementFromPoint` during `touchmove` (the clone has `pointer-events: none`) to find the element under the finger.

**Keyboard Shortcuts**
A single `keydown` listener on `document`. Checks `event.metaKey || event.ctrlKey`. Skips if `document.activeElement.isContentEditable` to avoid conflicts while typing.

**Tooltip System**
Only initialized on `pointer: fine` (mouse) devices. A single shared `<div class="tooltip">` is appended to `document.body`. A 300ms `setTimeout` triggers the tooltip on `mouseover`. The tooltip position is clamped to the viewport.

### Storage Keys

| Key | Contents |
|---|---|
| `banto:board` | Full board state as JSON array of columns |
| `banto:history` | Undo/redo stack (`{ history: [...], currentIndex: N }`) |
| `banto:{uuid}-title` | Individual card title text |
| `banto:{uuid}-notes` | Individual card notes text |
| `banto:{uuid}-column-title` | Individual column title text |

Each editable text node gets its own `localStorage` slot keyed by a UUID so that typing updates are saved immediately on `input`, not just on blur.

### HTML Structure

```
<nav class="navbar">              — Fixed top bar: brand + undo/redo/export/import/help
<main class="site-main">          — Scrollable main area
  <div class="kanban-container">  — Flex row of columns
    <div class="kanban-column">   — A single column
      <div class="kanban-column-title">   — Draggable title bar + delete button
      <div class="kanban-item">           — A card: header (title + complete + delete) + notes
      <button class="kanban-item-add">    — Add card button (+)
    <div class="kanban-column kanban-column-add">  — "add column" button column
<footer class="site-footer">      — Fixed bottom bar: copyright + links
<div class="help-overlay">        — Help modal (hidden by default)
<div class="tooltip">             — Shared tooltip element (desktop only)
```

---

## Deployment

### Requirements

- **Static file server** — Bantō is a static site. Any server that can serve files works.
- **No build step** — Edit files, refresh browser. Done.

### Option 1: Docker + Caddy (Recommended for Homelab)

The project ships with a `dockerfile` (based on `caddy:alpine`) and a `docker-compose.yaml`.

**Development:**
```bash
docker-compose up
```
Serves on `http://localhost:8090`. The `site/` directory is volume-mounted so changes are live immediately.

**Production (e.g. K3s / Kubernetes):**
```bash
docker build --build-arg CADDYFILE=Caddyfile.prod -t banto:latest .
```
The production Caddyfile serves `banto.erik-schuetze.dev` and `www.banto.erik-schuetze.dev` with automatic HTTPS via Caddy's built-in Let's Encrypt integration.

The `dockerfile` is minimal:
```dockerfile
FROM caddy:alpine
ARG CADDYFILE=Caddyfile.prod
COPY ./${CADDYFILE} /etc/caddy/Caddyfile
```
The `site/` directory is served from `/usr/share/caddy` (Caddy's default static root).

### Option 2: Static Hosting

Deploy the contents of `site/` to any static hosting provider. No server-side processing is needed.

- **Netlify / Vercel / GitHub Pages** — Drag and drop or connect the repo
- **Nginx / Apache** — Point the document root at `site/`
- **AWS S3 + CloudFront** — Upload files, configure static website hosting

### Option 3: Local Dev Server

```bash
# Python
cd site && python3 -m http.server 8090

# Node.js
cd site && npx http-server -p 8090
```

---

## Project File Structure

```
banto/
├── site/
│   ├── index.html          # Complete single-page app HTML
│   ├── assets/
│   │   └── favicon.svg     # SVG favicon (bold B in blue card style)
│   ├── css/
│   │   └── style.css       # All styles (722 lines): layout, components, mobile, animations
│   └── js/
│       └── app.js          # All application logic (1,326 lines): history, drag, persistence
├── Caddyfile.dev           # Dev server config (port 80, no HTTPS)
├── Caddyfile.prod          # Production config (automatic HTTPS via Let's Encrypt)
├── dockerfile              # Caddy Alpine container image
├── docker-compose.yaml     # Local dev environment (maps 8090 → container port 80)
└── README.md               # Project documentation
```

---

## Default Board State

When a user visits Bantō for the first time (no `localStorage` data), the board is pre-populated with three example columns:

1. **To Do** — Two sample cards: *"Concise item title"* with a description prompt, and *"Grab a coffee ☕"* with the note "You deserve it!"
2. **In Progress** — One card: *"Learn how to use Bantō"*, pointing to the Help button
3. **Done** — Empty, ready to receive completed cards

This gives new users an immediate understanding of what the board looks like and how to use it, without needing to read documentation first.

---

## Analytics

Bantō uses a self-hosted [Umami](https://umami.is/) analytics instance (`analytics.erik-schuetze.dev`) for privacy-friendly, cookieless page view tracking. No personal data is collected.

---

## Author & Links

- **Author:** Erik Schütze
- **Live app:** [banto.erik-schuetze.dev](https://banto.erik-schuetze.dev)
- **Source code:** [github.com/Erik-Schuetze/banto](https://github.com/Erik-Schuetze/banto)
- **Blog:** [erik-schuetze.dev/blog](https://erik-schuetze.dev/blog/)
- **Blog post about Bantō:** [erik-schuetze.dev/blog/banto/](https://erik-schuetze.dev/blog/banto/)
- **License:** MIT

---

## Summary for AI Blog Writing

Bantō is a **zero-dependency, zero-backend Kanban board** that runs entirely in the browser. It was built as a reaction against over-engineered productivity tools — a deliberate return to simplicity.

**Core narrative threads for a blog post:**
1. *The problem it solves:* Most Kanban tools are too heavy or require accounts and cloud sync. Bantō does not.
2. *The philosophical stance:* No frameworks, no build tools, no servers. Prove that vanilla web technologies are enough.
3. *The design aesthetic:* Warm, papery, geometric — a productive workspace that feels calm, not corporate.
4. *The homelab angle:* Perfect for self-hosters. One `docker-compose up` and it's running. Your data never leaves your machine.
5. *The UX polish:* Despite its simplicity, Bantō has full undo/redo with session persistence, touch drag support, keyboard shortcuts, export/import, tooltips, and a help modal — features you'd expect from a "real" app.
6. *The technical honesty:* 1,300 lines of vanilla JS can do a lot. The source is readable, hackable, and dependency-free.

