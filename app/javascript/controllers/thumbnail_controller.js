import { Controller } from "@hotwired/stimulus"
import Masonry from "masonry-layout"

export default class extends Controller {
  static targets = [ "thumbnails" ]

  initialize() {
    this.initThumbnailLayout();
  }

  initThumbnailLayout() {
    new Masonry('.product-thumbnail', {
      itemSelector: '.product-thumbnail__item',
      columnWidth: 242,
      gutter: 10,
      fitWidth: true,
    });
  }
}
