import "direct_uploads"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()

document.addEventListener("turbo:submit-start", async (event) => {
  const form = event.target;

  if (form.id === "ajax-city-form") {
    event.preventDefault(); 
    
    const formData = new FormData(form);
    const method = form.querySelector('input[name="_method"]')?.value || "POST";

    try {
      const response = await fetch(form.action, {
        method: method.toUpperCase(),
        body: formData,
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        }
      });

      if (response.ok) {
        const data = await response.json();

        const row = document.querySelector(`#city_row_${data.id}`);
        if (row) {
          row.querySelector(".city-name-display").innerText = data.name;
          row.querySelector(".city-country-display").innerText = data.country;
        }


        // Image logo Update 

const logoImg = row.querySelector(".city-logo-img");
          if (logoImg && data.logo_url) {
            logoImg.src = data.logo_url;
          }

// Multiple images update 

          const galleryContainer = row.querySelector(".city-gallery-container");
          if (galleryContainer && data.gallery_html) {
            galleryContainer.innerHTML = data.gallery_html;
          }


          // Video Update 

const videoContainer = row.querySelector(".city-video-container");
          if (videoContainer && data.video_url) {
            videoContainer.innerHTML = `<p class="small fw-bold mb-1 text-primary">Video Preview:</p>
                                        <video controls="controls" src="${data.video_url}" style="width: 100%; max-width: 200px;" class="rounded shadow-sm"></video>`;
          }

        const offcanvasElement = document.getElementById('cityOffcanvas');
const instance = bootstrap.Offcanvas.getOrCreateInstance(offcanvasElement); 
       if (instance) instance.hide();
      }
    } catch (error) {
      console.error("Update Error:", error);
    }
  }
});

// --- DELETE AJAX ---

document.addEventListener("click", async (event) => {
  const deleteBtn = event.target.closest(".delete-city-btn");
  if (!deleteBtn) return;

  event.preventDefault();
  if (!confirm("Are you sure?")) return;

  const response = await fetch(deleteBtn.href, {
    method: "DELETE",
    headers: { "Accept": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content }
  });

  if (response.ok) {
    deleteBtn.closest("tr").remove();
  }
});


// jquery part 

$(document).on('turbo:load', function() { 
    
    $("h5.mb-3").on("click", function() {
        
        $("form").slideToggle("slow"); 
        
        $(this).css("color", "blue").css("cursor", "pointer");
    });

    $("tr").hover(
        function() { $(this).addClass("table-warning"); },
        function() { $(this).removeClass("table-warning"); } 
    );
    
    
    $(".form-select").on("change", function() {
        let selectedVal = $(this).val();
        console.log("i am selected " + selectedVal);
    });

}); 