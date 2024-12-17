# Database Schema  

This document outlines the schema for the collections used in the SafeNest project.  

## Collections  

### CrimStatisticsFinal 
| Field       | Type   | Description                              |  
|-------------|--------|------------------------------------------|  
| `city`      | String | Name of the city (e.g., "East Greenwich").|  
| `crimeRate` | String | Crime rate percentage (e.g., "0.96%").   |  
| `nonviolent`| Number | Count of nonviolent crimes.              |  
| `population`| Number | Population of the city.                  |  
| `violent`   | Number | Count of violent crimes.                 |  

### Listings  
| Field                | Type      | Description                                                 |  
|----------------------|-----------|-------------------------------------------------------------|  
| `amenities`          | String    | Comma-separated list of amenities (e.g., "Storage Space").  |  
| `area`               | Number    | Area of the property in square feet.                       |  
| `bathroom`           | Number    | Number of bathrooms.                                       |  
| `bedroom`            | Number    | Number of bedrooms.                                        |  
| `city`               | String    | City where the listing is located (e.g., "Woonsocket").    |  
| `cityReference`      | Reference | Reference to a city in the `CrimStatisticsFinal` collection.|  
| `imgUrl`             | String    | URL of the primary image of the property.                  |  
| `landlordDisplayName`| String    | Display name of the landlord.                              |  
| `landlordId`         | Reference | Reference to the landlord's user document in `users`.      |  
| `latitude`           | Number    | Latitude coordinate of the property.                      |  
| `listedPrice`        | Number    | Listed price of the property.                             |  
| `longitude`          | Number    | Longitude coordinate of the property.                     |  
| `lotArea`            | Number    | Lot area in acres.                                         |  
| `marketEstimate`     | Number    | Market value estimate of the property.                    |  
| `ppSq`               | Number    | Price per square foot.                                     |  
| `rentEstimate`       | Number    | Monthly rent estimate.                                     |  
| `state`              | String    | State where the property is located.                      |  
| `street`             | String    | Street address.                                            |  
| `zipcode`            | String    | ZIP code.                                                  |  

### users  
| Field          | Type      | Description                                                |  
|----------------|-----------|------------------------------------------------------------|  
| `birth_date`   | Timestamp | User's date of birth.                                       |  
| `created_time` | Timestamp | Account creation timestamp.                                 |  
| `display_name` | String    | User's display name (e.g., "Christian Lopez").             |  
| `email`        | String    | User's email address.                                       |  
| `landlord_value`| Boolean   | Indicates if the user is a landlord.                       |  
| `owned_property`| Array     | Array of references to the user's owned listings in `Listings`.|  
| `phone_number` | String    | User's phone number.                                        |  
| `photo_url`    | String    | URL of the user's profile photo.                           |  
| `uid`          | String    | Unique identifier for the user.                            |  

### Chats  
| Field              | Type      | Description                                              |  
|--------------------|-----------|----------------------------------------------------------|  
| `displayNames`     | Array     | Array of display names involved in the chat.             |  
| `lastMessage`      | String    | Last message sent in the chat.                           |  
| `lastMessageSeenBy`| Array     | Array of references to users who have seen the last message.|  
| `listingAddress`   | String    | Address of the associated listing.                      |  
| `listingPic`       | String    | URL of the associated listing image.                    |  
| `timeStamp`        | Timestamp | Timestamp of the last message.                          |  
| `userIds`          | Array     | Array of references to user documents in `users`.       |  
