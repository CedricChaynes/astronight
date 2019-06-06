

const hideCalendarBtn = () => {
  const btn = document.querySelector('.calendar_btn');
  if (btn) {
    btn.addEventListener('click', e => {
      btn.style.display = "none";
      document.querySelector(".div_btn_confirmation").innerHTML = "<i> Je participe ✓</i>"
    });
  }
}

export { hideCalendarBtn }
