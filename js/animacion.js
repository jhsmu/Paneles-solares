    const titleElement = document.querySelector(".typing-title");
    const subtitleElement = document.querySelector(".typing-subtitle");

    const titleText = "QuibdóSolar";
    const subtitleText = "Venta de paneles solares";

    function typeText(element, text) {
      return new Promise((resolve) => {
        let i = 0;
        const timer = setInterval(() => {
          element.textContent += text[i];
          i++;
          if (i === text.length) {
            clearInterval(timer);
            resolve();
          }
        }, 100); // Ajusta la velocidad de escritura aquí
      });
    }

    async function animateText() {
      await typeText(titleElement, titleText);
      await new Promise(resolve => setTimeout(resolve, 1000)); // Espera 1 segundo
      subtitleElement.textContent = ""; // Borra el contenido anterior
      await typeText(subtitleElement, subtitleText);
    }

    animateText();