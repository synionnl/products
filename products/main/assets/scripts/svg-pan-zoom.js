(() => {
  document.querySelectorAll('div[data-fullscreen] figure svg, div[data-fullscreen] figure embed').forEach(panZoomElement => {
    const fullscreenContainer = panZoomElement.closest('[data-fullscreen]');
    const zoomButtons = fullscreenContainer.querySelectorAll('[data-figure-zoom]');
    let panZoom;

    const handleZoom = event => {
      if (!panZoom) {
        return;
      }

      switch (event.currentTarget.dataset.figureZoom) {
        case 'in':
          panZoom.zoomIn();
          break;

        case 'out':
          panZoom.zoomOut();
          break;

        default:
          panZoom.reset();
      }
    }

    fullscreenContainer.setAttribute('data-fullscreen-zoom', true);

    panZoomElement.addEventListener('load', function() {
      panZoom = svgPanZoom(panZoomElement, {
        controlIconsEnabled: false
        , zoomEnabled: false
        , panEnabled: false
        , fit: 1
        , center: 1
      });
    });

    window.addEventListener('resize', () => {
      if (panZoom) {
        panZoom.resize();
        panZoom.fit();
        panZoom.center();
      }
    });

    fullscreenContainer.addEventListener('openfullscreen', () => {
      if (panZoom) {
        panZoomElement.style.removeProperty('pointer-events');
        panZoom.resize();
        panZoom.fit();
        panZoom.center();
        panZoom.enablePan(); 
        panZoom.enableZoom();
      }
    });

    fullscreenContainer.addEventListener('closefullscreen', () => {
      if (panZoom) {
        panZoom.resize();
        panZoom.fit();
        panZoom.center();
        panZoom.disablePan();
        panZoom.disableZoom();
      }
    });

    zoomButtons.forEach(button => {
      button.addEventListener('click', handleZoom);
    });
  });
})();
