# Homey Project Feed

## 📌 Overview

**Homey Project Feed** is a **real-time project tracking application** built using **Ruby on Rails 8**. It allows users to **create projects, manage project states, and collaborate with team members**. Live updates are powered by **Action Cable and Turbo Streams**, while **Statesman gem** handles project state management.

---

## 🚀 Features

- **Project Management**: Create, edit, and update projects.
- **Live Status Updates**: Uses **Turbo Streams and Action Cable** for real-time updates.
- **State Management**: Managed using **Statesman gem**.
- **User Collaboration**: Assign users to projects and allow role-based interactions.
- **Live Project Feed**: Users can comment on projects, and updates are **appended live**.
- **Secure Authentication**: Built with **Devise** for user authentication.
- **Modern UI**: Styled using **Tailwind CSS and DaisyUI**.

---

## 🎨 UI Libraries & Styling

- **Tailwind CSS**: Provides a modern, responsive UI.
- **DaisyUI**: Used for pre-styled UI components.
- **Turbo & Turbo Streams**: Enables **real-time updates** without reloading the page.

---

## ⚡ Real-time Features

- **Action Cable** for **WebSocket connections**.
- **Turbo Streams** for **live status updates & comments**.
- **Project status updates are broadcasted to all connected users.**
- **New comments appear in real-time without page refresh.**

---

## 🏷️ Project States

The following states are available for projects:

1. **new** (Default)
2. **in_progress**
3. **on_hold**
4. **completed**
5. **archived**

Each state transition is **validated using the Statesman gem**.

---

## 📹 Loom Demo

[**Watch the Project Walkthrough Here**](https://www.loom.com/share/f04f10f426fd4a5f97c686de481b5330?sid=d35670db-938a-4bdb-b5b0-1679d1b71477)

---

## 🔧 Installation & Setup

### **Clone the repository**

```sh
git clone https://github.com/yourusername/homey-project-feed.git
cd homey-project-feed
bundle install
rails db:create db:migrate db:seed
rails s
visit http://localhost:3000
```
