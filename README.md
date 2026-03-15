# Instagram Feed Flutter App

## Overview

This project implements an Instagram-style feed using Flutter.  
It demonstrates key mobile development concepts such as state management, infinite scrolling, shimmer loading placeholders, and pinch-to-zoom image interactions.

## Features

- Shimmer loading skeleton while posts are fetched
- Infinite scrolling feed
- Pinch-to-zoom interaction on images
- Like toggle interaction
- Save (bookmark) toggle interaction
- Image caching for better performance
- Multi-image carousel posts with page indicator

## State Management

This project uses Provider for state management.

Provider was chosen because:

- It is lightweight and easy to integrate with Flutter
- It efficiently manages UI state updates
- It simplifies handling interactions like likes, saves, and feed updates

## Tech Stack

- Flutter
- Provider
- Cached Network Image
- Shimmer
- InteractiveViewer (for pinch zoom)

## How to Run the Project

1. Clone the repository

git clone https://github.com/AnanyaSingh49/instagram-flutter-feed

2. Navigate into the project folder

cd instagram_feed_app

3. Install dependencies

flutter pub get

4. Run the app

flutter run

## Demo

The demo video showcases:

- Shimmer loading state
- Smooth infinite scrolling
- Pinch-to-zoom interaction
- Like and Save toggle interactions

Demo link: (Add Loom or MP4 link here)

## Author

Ananya Singh
