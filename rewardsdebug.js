if (window.location.href.includes("https://rewards.bing.com/")) {
  function showNotification(message, color = "#4CAF50") {
    const notification = document.createElement('div');
    notification.style.cssText = `
      position: fixed;
      top: 10px;
      right: 10px;
      background: ${color};
      color: white;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.3);
      z-index: 9999;
      font-family: Arial, sans-serif;
      font-weight: bold;
      max-width: 300px;
    `;
    notification.textContent = message;
    document.body.appendChild(notification);
    return notification;
  }

  function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  }

  function updatePointsProgressively(originalValue, element) {
    const originalText = element.textContent;
    const numberMatch = originalText.match(/\d+/);
    
    if (!numberMatch) return false;
    
    const currentValue = parseInt(numberMatch[0]);
    if (currentValue > 99000000) return false;
    
    const targetValue = 99000000 + currentValue;
    
    const totalSteps = 150;
    const stepDelay = 30;
    const increment = Math.max(1, Math.ceil((targetValue - currentValue) / totalSteps));
    let currentStep = 0;
    let newValue = currentValue;
    
    function updateStep() {
      if (currentStep < totalSteps && newValue < targetValue) {
        newValue += increment;
        if (newValue > targetValue) newValue = targetValue;
        
        element.textContent = originalText.replace(numberMatch[0], formatNumber(newValue));
        
        currentStep++;
        setTimeout(updateStep, stepDelay);
      }
    }
    
    updateStep();
    return true;
  }

  function updateAllNumbers() {
    const allElements = document.querySelectorAll('*');
    const elementsWithNumbers = [];
    
    allElements.forEach(element => {
      if (element.children.length === 0 && 
          element.textContent && 
          /\d/.test(element.textContent) &&
          element.textContent.trim().length > 0) {
        
        const excludedTexts = ['px', 'width', 'height', 'margin', 'padding', 'font'];
        const shouldExclude = excludedTexts.some(text => 
          element.textContent.toLowerCase().includes(text)
        );
        
        if (!shouldExclude) {
          elementsWithNumbers.push(element);
        }
      }
    });
    
    let updatedCount = 0;
    elementsWithNumbers.forEach(element => {
      if (updatePointsProgressively(element.textContent, element)) {
        updatedCount++;
      }
    });
    
    return updatedCount;
  }

  const loadingNotif = showNotification("Loading Debug Script", "#2196F3");
  
  setTimeout(() => {
    loadingNotif.textContent = "Loading Module Script";
    
    setTimeout(() => {
      updateAllNumbers();
      
      setTimeout(() => {
        if (loadingNotif.parentNode) {
          loadingNotif.parentNode.removeChild(loadingNotif);
        }
        const successNotif = showNotification("Success");
        setTimeout(() => {
          if (successNotif.parentNode) {
            successNotif.parentNode.removeChild(successNotif);
          }
        }, 5000);
      }, 4500);
      
    }, 2000);
    
  }, 1500);
  
} else {
  alert('Este script solo funciona en https://rewards.bing.com/');
}
