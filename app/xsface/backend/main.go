package main

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
	"github.com/pion/webrtc/v3"
)

const (
	webport = ":8080"
)

var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func main() {
	// setup http server
	http.HandleFunc("/ws", handleWebsocket)
	fs := http.FileServer(http.Dir("./web"))
	http.Handle("/", fs)

}

func handleWebsocket(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)

	if err != nil {
		log.Println(err)
		return
	}

	defer conn.Close()

	for {
		_, message, err := conn.ReadMessage()

		if err != nil {
			log.Println("Error encountered!")
			break
		}

		log.Println("Received message: %s", message)
	}

	//Handle websocket connection and signaling

}

func createPeerConnection() (*webrtc.PeerConnection, error) {

}
