import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["recommendations"]
  
  recommendationsTargetConnected() {
    this.load(1);
  }

  load(page) {
    const queryString = new URLSearchParams({
      page: page,
      commendable_type: this.recommendationsTarget.dataset.commendableType,
      commendable_id: this.recommendationsTarget.dataset.commendableId,
    }).toString();

    fetch(`/recommendations?${queryString}`)
    .then((response) => {
      if (!response.ok) {
        throw new Error('Network response was not ok ' + response.statusText);
      }
      return response.text(); // Returns a promise that resolves with the JSON data
    })
    .then((html) => {
      this.recommendationsTarget.innerHTML = html;
    });
  }

  loadMore(event) {
    const page = event.currentTarget.dataset.page;
    this.load(page);
  }
}
