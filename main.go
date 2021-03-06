package main

import (
	"io/ioutil"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)

	if err != nil {
		log.Fatalln(err.Error())
	}

	log.Println(string(body))
}

func main() {
	http.HandleFunc("/add", handler)
	log.Fatal(http.ListenAndServe(":80", nil))
}
