import { Controller } from "@hotwired/stimulus"
import Masonry from "masonry-layout"

export default class extends Controller {
  static targets = ["thumbnails", "preview"]

  thumbnailsTargetConnected() {
    new Masonry('.product-thumbnail', {
      itemSelector: '.product-thumbnail__item',
      columnWidth: 242,
      gutter: 10,
      fitWidth: true,
    });
  }

  showProduct(event) {
    window.location.href = event.currentTarget.dataset.productPath;
  }

  selectThumbnail(event) {
    this.previewTarget.src = event.currentTarget.dataset.previewUrl
  }
}
