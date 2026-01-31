
# PanelFlow Documentation

PanelFlow is a high-performance, aesthetically-driven comic library organizer and reader. It is designed as a **Progressive Web App (PWA)** that manages local comic collections (CBZ and PDF formats) through a dedicated Node.js backend. It focuses on batch metadata management, series-based sequencing, and a seamless reading experience across devices.

---

## Table of Contents
- [Part 1: Frontend Architecture](#part-1-frontend-architecture)
  - [Features](#frontend-features)"&"&""
  - [Component Tree](#frontend-component-tree)
  - [Navigation & State Problem](#problem-navigation--state)
  - [Memory Management Problem](#problem-memory-management)
  - [Frontend Lexicon](#frontend-lexicon)
- [Part 2: Backend Architecture](#part-2-backend-architecture)
  - [Features](#backend-features)
  - [Upload Pipeline](#upload-pipeline-flowchart)
  - [Database Strategy](#database-strategy)
  - [Backend Lexicon](#backend-lexicon)
- [Part 3: Common Concepts & Glossary](#part-3-common-concepts--glossary)
  - [PWA Lifecycle](#pwa-lifecycle)
  - [Privacy Architecture](#privacy-architecture)
  - [Glossary](#glossary)

---<!--  -->

<a name="part-1-frontend-architecture"></a>
## Part 1: Frontend Architecture

The frontend is built with **React 19** and **Tailwind CSS**, utilizing a single-page architecture that simulates multi-page navigation through internal state and the browser's History API.

<a name="frontend-features"></a>
### Features
- **Dynamic Views**: Support for Grid, List, and Compact layouts.
- **Advanced Filtering**: Filter by "Never Read", "Started", oh
- **Batch Editing**: Modify metadata for hundreds of comics simultaneously, including smart sequence renumbering.
- **Immersive Reader**: Support for LTR, RTL, and Vertical (Webtoon) scrolling with side-by-side page support.
- **Insights Dashboard**: Visualized reading statistics using Recharts.

<a name="frontend-component-tree"></a>
### Component Tree
```text
App (Root)
├── Sidebar (Navigation & Upload Trigger)
├── StatusFilters (Status Toggles & Random Picker)
├── Library (Main Gallery)
│   ├── SeriesGroup (Collapsible series containers)
│   └── ComicCard / ComicListRow / ComicCompactRow
├── Reader (Immersive Fullscreen UI)
├── Dashboard (Recharts Visualizations)
├── ComicDetailView (Focused Metadata & Progress)
├── MetadataModal (Single/Batch Metadata Entry)
├── BatchEditModal (Series/Author level management)
└── ConfirmModal (Global confirmation dialogs)
```

<a name="problem-navigation--state"></a>
### Problem: Navigation & State Persistence
**Problem**: The application does not use a third-party router (like React Router). Standard refreshes or back-button actions would cause the React state (current view, selected author, etc.) to reset to the default library view.
**Cause**: The UI is tied to local `useState` variables which are ephemeral.
**Solution**: Implementation of a **Navigation State Sync** strategy in [App.tsx](./App.tsx).
1.  **pushState**: When `navigateTo` is called, we store a [NavigationState](./App.tsx#L16) object in `window.history.pushState`.
2.  **onpopstate**: A global listener in `useEffect` detects when the user hits "Back". It reads the state object and restores the React state variables manually, ensuring the UI stays in sync with the browser's URL history.

<a name="problem-memory-management"></a>
### Problem: Memory Management in Reader
**Problem**: Large high-resolution CBZ files can contain hundreds of images. Rendering them all or preloading aggressively leads to browser tab crashes.
**Cause**: High-resolution textures staying in GPU memory.
**Solution**:
1.  **Preload Set**: A `preloadedUrls` `Set` tracks what has been loaded to prevent redundant requests.
2.  **Explicit Decoding**: Using `img.decode()` in [Reader.tsx](./components/Reader.tsx) to perform image decompression on a background thread before drawing, preventing main-thread stutter.
3.  **Dynamic Rendering**: Distant pages are marked `loading="lazy"`, while immediate neighbours are `loading="eager"`.

<a name="frontend-lexicon"></a>
### Frontend Lexicon
| Function | File | Description |
| :--- | :--- | :--- |
| `navigateTo` | `App.tsx` | Updates internal view state and pushes a record to browser history. |
| `transformComicData` | `api.ts` | Resolves relative backend paths to absolute URLs using the current host. |
| `naturalCompare` | `App.tsx` | Sorts strings with numbers (e.g., "Vol 2" after "Vol 10" normally, but this makes it "Vol 2" then "Vol 10"). |
| `groupComics` | `App.tsx` | Processes the raw comic list into `SeriesGroup` objects for the library. |
| `scrollToPage` | `Reader.tsx` | Handles smooth scrolling in Vertical mode when clicking the progress bar. |

---

<a name="part-2-backend-architecture"></a>
## Part 2: Backend Architecture

The backend is a **Node.js/Express** server that handles file persistence, archive extraction, and metadata storage.

<a name="backend-features"></a>
### Features
- **Disk-Based Storage**: No heavy database; uses a simple `comics.json` file for ACID-lite portability.
- **CBZ Extraction**: Uses `adm-zip` to extract images into structured directories on the fly.
- **Static Asset Serving**: Serves extracted images via the `/data` endpoint.

<a name="upload-pipeline-flowchart"></a>
### Upload Pipeline Flowchart
```text
User selects File -> Client calls /api/upload (Multer)
                     │
            File saved to /data/temp
                     │
            AdmZip scans for images (JPG/PNG/WEBP)
                     │
            Images extracted to /data/comics/[ID]/
                     │
            Metadata + File Paths saved to comics.json
                     │
            Backend returns JSON object to Frontend
```

<a name="database-strategy"></a>
### Database Strategy
The backend uses a **Flat-File JSON database**. 
- **Read**: `getComics()` reads and parses `comics.json`.
- **Write**: `saveComics()` overwrites `comics.json` with the updated array.
- **Relationship**: All metadata is embedded within the comic object. Series grouping is performed at the **Frontend** level to keep the backend logic simple and stateless.

<a name="backend-lexicon"></a>
### Backend Lexicon
| Function | File | Description |
| :--- | :--- | :--- |
| `multer.diskStorage` | `server.js` | Configures where uploaded raw files are temporarily stored. |
| `zip.getEntries` | `server.js` | Iterates through CBZ contents to find valid image files. |
| `fs.realpathSync` | `server.js` | Resolves the absolute path of the storage directory to prevent symlink errors. |
| `app.patch` | `server.js` | Set of endpoints for updating progress, settings, or metadata fields. |

---

<a name="part-3-common-concepts--glossary"></a>
## Part 3: Common Concepts & Glossary

<a name="pwa-lifecycle"></a>
### PWA Lifecycle
PanelFlow utilizes [sw.js](./sw.js) with a **Stale-While-Revalidate** strategy. 
- **Install**: Caches the core UI (HTML/JS).
- **Fetch**: Returns cached assets immediately for speed, then updates the cache from the network in the background. 
- **Offline**: The library can be browsed offline if the assets were previously cached.

<a name="privacy-architecture"></a>
### Privacy Architecture
- **NSFW Mode**: Controlled by the `showNsfw` state in `App.tsx`. 
- **Logic**: Comics are flagged `isNsfw: true`. The frontend performs a `filter()` on the dataset before rendering.
- **Secret Vault**: The sidebar button "EXIT SECRET MODE" toggles this state. Currently, this is a UI-level filter.

<a name="glossary"></a>
### Glossary
- **CBZ**: Comic Book Zip. A standard ZIP file renamed to .cbz containing sequential images.
- **Sequence Shift**: A feature in [MetadataModal](./components/MetadataModal.tsx) that automatically moves existing issue numbers if a new volume is inserted into the middle of a series.
- **Smart Renumbering**: A UI logic that automatically calculates the next issue number in a sequence based on the previous input.
- **Standalone**: A comic that is not part of a series (e.g., a One-shot).
- **Standalone Mode (PWA)**: When the manifest allows the app to run without a browser URL bar (Fullscreen).

---
*End of Documentation*

