# Motional

## Table of Contents

1. [Overview](#overview)
2. [Product Spec](#product-spec)
3. [Wireframes](#wireframes)
4. [Schema](#schema)

## Overview

**Motional** is an app that seamlessly combines guided mindfulness meditation with easy-to-follow at-home workout routines. Users have the flexibility to tailor their sessions based on duration, difficulty level, and specific focus areas, fostering a comprehensive approach to mental and physical well-being.

- Special thanks to API Ninjas, implemented Exercises API from them.

*Demo* <div>
    <a href="https://www.loom.com/share/d7be35a1eb694f04968bbbd09ea8a5db">
    </a>
    <a href="https://www.loom.com/share/d7be35a1eb694f04968bbbd09ea8a5db">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/d7be35a1eb694f04968bbbd09ea8a5db-with-play.gif">
    </a>
  </div>

## Sprints

**Sprint 1:**
 - [x] created tab bar controller
 -  [x] created home and profile viewcontrollers w/ table view and cells
 - [x] implemented exercies api (TLDR: The Exercises API provides access a comprehensive list of thousands of exercises targeting every major muscle group.)

**Things to Fix**
 - [x] api doesn't print anything in table view cell
       
*Video:<div>*
    <a href="https://www.loom.com/share/bf1ebda81f91438697114042bcff4ff0">
    </a>
    <a href="https://www.loom.com/share/bf1ebda81f91438697114042bcff4ff0">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/bf1ebda81f91438697114042bcff4ff0-with-play.gif">
    </a>
  </div>

  **Sprint 2 (Last Sprint):**
  - [x] Added Launch Screen for Visual Appeal
  - [x] Created Profile View Controller (users can put down their name, email, and goals and save them in the app)

  **Future Plans with App**
  - [x] Creat A Favorites View Controller (users can save their exercises)
  - [x] Can add the amount of sets and reps complete per favorite exercises
        
*Video:*<div>
    <a href="https://www.loom.com/share/29597536e3f54b54b1b722a0e3017ef5">
    </a>
    <a href="https://www.loom.com/share/29597536e3f54b54b1b722a0e3017ef5">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/29597536e3f54b54b1b722a0e3017ef5-with-play.gif">
    </a>
  </div>
 

### App Evaluation

- **Category:** Health & Fitness
- **Mobile:** Mindful Motion takes full advantage of mobile capabilities by integrating sensors for real-time workout tracking and providing an engaging audio experience, making it more than just a static website.
- **Story:** The app tells a compelling story of promoting holistic well-being through the harmonious blend of mindfulness and fitness, offering users a narrative that resonates with their pursuit of a balanced lifestyle.
- **Market:** Positioned in the health and fitness category, Mindful Motion caters to a broad audience while providing unique value, making it appealing to those seeking a comprehensive well-being experience.
- **Habit:** With the potential to become a habitual part of users' routines, Mindful Motion encourages frequent engagement through regular mindfulness and workout sessions, creating an active and dynamic user experience.
- **Scope:** The scope is well-formed, focusing on the seamless integration of mindfulness and fitness in a user-friendly app. While incorporating sensors presents a technical challenge, a stripped-down version of the app remains interesting and valuable.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can customize mindfulness and workout sessions based on time, difficulty, and focus areas.
* The app provides real-time feedback through sensor integration during workouts.

**Optional Nice-to-have Stories**

* Integration with wearable devices for enhanced workout tracking.
* Social features for users to share their well-being journey.

### 2. Screen Archetypes

- [ ] Home Screen
  * Displays customizable session options.
- [ ] Session Detail Screen
  * Provides detailed information on selected session parameters.
- [ ] Workout Screen
  * Guides users through the workout with real-time feedback.
- [ ] Profile Screen
  * Allows users to track their well-being progress.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Sessions
* Profile

**Flow Navigation** (Screen to Screen)

- [ ] Home Screen
  * Navigates to Session Detail Screen on session selection.
- [ ] Session Detail Screen
  * Navigates to Workout Screen on session start.
- [ ] Workout Screen
  * Navigates to Profile Screen after completing a session.

## Wireframes

![Mindful Motion Hand-Sketched Wireframes](https://cdn.discordapp.com/attachments/803439001138757642/1171924486409441420/IMG_0119.jpg?ex=655e72ba&is=654bfdba&hm=e30b8e6ad5b13248805ffa37fb6907956f13034e1e71758cc3aad35df492f8a6&)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using an existing API such as health and fitness databases]

## License

    Copyright [2023] [Ryan Tran]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

