import { Controller } from "@hotwired/stimulus"
import Dropzone from "dropzone";

export default class extends Controller {
  static targets = ["photo", "coverPhoto"];

  photoTargetConnected() {
    this.initDropzone(
      this.photoTarget, 
      "Select photo", 
      { 
        maxFiles: 1,
        thumbnailWidth: 220,
        thumbnailHeight: 220,
        resizeWidth: 220,
        resizeHeight: 220,
        maxFiles: 1,
      }
    );
  }

  coverPhotoTargetConnected() {
    this.initDropzone(
      this.coverPhotoTarget, 
      "Select cover photo",
      {
        thumbnailWidth: 640,
        thumbnailHeight: 160,
        resizeWidth: 1280,
        resizeHeight: 320,
        maxFiles: 1,
      }
    );
  }

  initDropzone(target, label = "Select photo", opts = {}) {
    new Dropzone(`div#${target.dataset.id}`, {
      url: target.dataset.uploadUrl,
      method: "post",
      clickable: true,
      uploadMultiple: false,
      acceptedFiles: "image/*",
      addRemoveLinks: true,
      dictDefaultMessage: label,
      maxFilesize: 2097152,
      headers: {
        "Authorization-Token": this.authToken(),
        "X-CSRF-Token": this.csrfToken(),
      },
      ...opts,
    });
  }

  authToken() {
    const authTokenMetaTag = document.querySelector('meta[name="auth-token"]');
    if (authTokenMetaTag) {
      return authTokenMetaTag.getAttribute('content');
    } else {
      return null;
    }
  }

  csrfToken() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    return token;
  }
}
