window.Pages = {}
window.Pages["Backpackistan"] = { content: "The main page for Backpackistan" }
window.Pages["Backpackistan/Introduction/Short"] = { content: "A short introduction to Backpackistan" }
window.Pages["Backpackistan/Introduction/Short/Eating"] = { content: "The only food available in Backpackistan is tourists - the vegans taste the best." }

window.Destinations = [
  {
    atlas_type: 'place'
    uri: "http://atlas.local/places/backpackistan"
    name: "Backpackistan"
    pages: ["Backpackistan", "Backpackistan/Introduction/Short", "Backpackistan/Introduction/Short/Eating"]
  },
  {
    atlas_type: 'poi'
    uri: "http://atlas.local/pois/backpackistanTourismCentre"
    name: "Backpackistan Tourism Centre"
    content: "The backpackistan tourism centre has been closed for years, but the building is worth seeing."
    position: {
      latitude: -34.397
      longitude: 150.644
    }
  },
  {
    atlas_type: 'poi'
    uri: "http://atlas.local/pois/backpackistanTouristFarm"
    name: "Backpackistan Tourist Farm"
    content: "The backpackistan tourist farm is the countries main food supply. Well worth a trip."
    position: {
      latitude: -34.398
      longitude: 150.654
    }
  }
]