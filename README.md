# 🛠️ ServiceListApp – SwiftUI

A modern iOS SwiftUI app that displays a list of service appointments with detailed views and search functionality.

---

## 🚀 Features

- 📋 **List of Services** – Displays mock service data in a clean, scrollable UI
- 🔍 **Search** – Filter services by title, description, or customer
- 🔄 **Pull to Refresh** – Simulates reloading data
- 📍 **Detail View** – Shows map, status, and service info
- 🎨 **Modern UI** – Rounded cards, shadows, colored badges, and more
- 🧪 **Single File Version** – Self-contained app for quick testing or submission

---

## 📸 Screenshots

| Service List | Detail View |
|--------------|-------------|
| ![List](./screenshots/list.png) | ![Detail](./screenshots/detail.png) |

*(replace with actual screenshots or remove this section if unnecessary)*

---

## 🧰 Tech Stack

- **Language:** Swift
- **Framework:** SwiftUI
- **Architecture:** MVVM (in a minimal way)
- **Mock Data:** Locally generated sample list

---

## 🧪 How to Run

1. Open Xcode and create a new **iOS App (SwiftUI)**
2. Replace the contents of `ContentView.swift` with the provided single-file app
3. Run on iPhone Simulator or real device (iOS 15+ recommended)

---

## 📂 File Structure (for multi-file setup)
📁 ServiceListApp
├── ServiceListView.swift
├── ServiceRowView.swift
├── ServiceDetailView.swift
├── ServiceListViewModel.swift
├── SampleData.swift
└── Utility.swift

---

## ✨ UI Highlights

- Status badges with colored indicators
- Top-right dot indicating status
- Search bar with mic icon and magnifying glass
- Clean list without disclosure arrows
- Rounded map in detail screen

---

## 📦 Future Improvements

- Integrate real API (currently uses mock data)
- Add voice search functionality
- Persist search history
- Support dark mode

---

## 👨‍💻 Author

**Purna Sindhu Bachu**  
GitHub: [purnasindhuB](https://github.com/purnasindhuB)

---

## 📄 License

This project is for demo or educational use. No license enforced.


