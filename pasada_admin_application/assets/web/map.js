var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
class MapManager {
    constructor(apiKey) {
        this.map = null;
        this.defaultPosition = { lat: 14.191723, lng: 120.971812 }; // fallback position
        this.initializeMap(apiKey);
    }
    initializeMap(apiKey) {
        return __awaiter(this, void 0, void 0, function* () {
            // gawa tayo ng map container
            const mapElement = document.createElement("div");
            mapElement.id = "map";
            mapElement.style.height = "100vh";
            mapElement.style.width = "100vw";
            document.body.appendChild(mapElement);
            // load Google Maps API
            yield this.loadGoogleMaps(apiKey);
            // get user's position
            const position = yield this.getUserPosition();
            // initialize map
            this.map = new google.maps.Map(mapElement, {
                center: position || this.defaultPosition,
                zoom: position ? 14 : 8,
                disableDefaultUI: true,
            });
        });
    }
    loadGoogleMaps(apiKey) {
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
    getUserPosition() {
        return new Promise((resolve) => {
            if (!navigator.geolocation) {
                resolve(null);
                return;
            }
            navigator.geolocation.getCurrentPosition((position) => resolve({
                lat: position.coords.latitude,
                lng: position.coords.longitude
            }), (error) => {
                console.error('Geolocation error:', error);
                resolve(null);
            }, { timeout: 5000 });
        });
    }
}
