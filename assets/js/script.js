function updateTime() {
  const now = new Date();
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');
  document.getElementById("currentTime").textContent = `Hora atual: ${hours}:${minutes}`;
}
setInterval(updateTime, 60000);
updateTime();

function startTimer() {
  const hours = parseInt(document.getElementById("hoursInput").value) || 0;
  const minutes = parseInt(document.getElementById("minutesInput").value) || 0;

  if (hours < 0 || minutes < 0 || minutes > 59) return;

  let timeRemaining = (hours * 60 * 60) + (minutes * 60);
  
  document.getElementById("timerForm").style.display = "none";
  document.getElementById("timer").style.display = "block";
  document.getElementById("timerLabel").textContent = "Tempo restante:";

  const countdown = setInterval(function() {
    if (timeRemaining <= 0) {
      clearInterval(countdown);
      document.getElementById("timer").textContent = "00:00";
    } else {
      timeRemaining--;
      const remainingHours = Math.floor(timeRemaining / 3600);
      const remainingMinutes = Math.floor((timeRemaining % 3600) / 60);
      const remainingSeconds = timeRemaining % 60;
      document.getElementById("timer").textContent = 
        `${String(remainingHours).padStart(2, '0')}:${String(remainingMinutes).padStart(2, '0')}:${String(remainingSeconds).padStart(2, '0')}`;
    }
  }, 1000);
}
