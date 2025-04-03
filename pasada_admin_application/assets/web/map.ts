class MapManager {
  private map: google.maps.Map | null = null;
  private defaultPosition = { lat: 14.191723, lng: 120.971812 }; // fallback position

  constructor(apiKey: string) {
    this.initializeMap(apiKey);
  }

  private async initializeMap(apiKey: string): Promise<void> {
    // gawa tayo ng map container
    const mapElement = document.createElement("div");
    mapElement.id = "map";
    mapElement.style.height = "100vh";
    mapElement.style.width = "100vw";
    document.body.appendChild(mapElement);

    // load Google Maps API
    await this.loadGoogleMaps(apiKey);

    // get user's position
    const position = await this.getUserPosition();

    // initialize map
    this.map = new google.maps.Map(mapElement, {
      center: position || this.defaultPosition,
      zoom: position ? 14 : 8,
      disableDefaultUI: true,
    });
  }

  private loadGoogleMaps(apiKey: string): Promise<void> {
    return new Promise((resolve) => {
      const script = document.createElement("script");
      script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}`;
      script.async = true;
      script.defer = true;
      document.head.appendChild(script);
      script.onload = () => resolve();
    });
  }

  // getting user's position my nigga
  private getUserPosition(): Promise<google.maps.LatLngLiteral | null> {
    return new Promise((resolve) => {
      if (!navigator.geolocation) {
        resolve(null);
        return;
      }

      navigator.geolocation.getCurrentPosition(
        (position) => resolve({
          lat: position.coords.latitude,
          lng: position.coords.longitude
        }),
        (error) => {
          console.error('Geolocation error:', error);
          resolve(null);
        },
        { timeout: 5000 }
      );
    });
  }
}

