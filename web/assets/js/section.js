/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


document.addEventListener("DOMContentLoaded", function() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    for (const link of links) {
        link.addEventListener("click", fuction (event) {
            event.preventDefault();
            
            const targetID = this.getAttribute("href");
            const targetSection = document.querySelector(targetID);
            
            targetSection.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        });
    }
});