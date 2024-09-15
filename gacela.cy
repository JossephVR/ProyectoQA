describe('Casos de prueba para la ventana: Clients', function () {
  beforeEach(function () {
      Cypress.on('uncaught:exception', (err, runnable) => {
          return false
      })
      cy.visit('https://estudiantec.gacela.io/login');

      cy.wait(200)

      cy.get('input[name="email"]').type('warrenalvarez@estudiantec.cr');
      cy.get('input[name="password"]').type('1lTlIewCKP');
      cy.xpath('//*[@id="app"]/div/div/main/div[1]/div/div/div[2]/form[1]/button/h5').click()

      cy.wait(200)

      cy.visit('https://estudiantec.gacela.io/clients');
  });

  //El siguiente caso de prueba funciona correctamente.
  it('Caso de prueba: 1', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div/div[1]/div/div[3]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[3]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Phone, 
  //a la vez, sobrepasa los 255 caracteres.
  it('Caso de prueba: 2', function () {
  cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
      cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
      cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click({ force: true }).then(function () {            
          cy.wait(500);
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
          cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div/div[1]/div/div[3]/div/button').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[3]/div/button[2]').click();
          cy.wait(500);
         });          
     });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Email (Contacts), 
  //a la vez, sobrepasa los 255 caracteres.
  it('Caso de prueba: 3', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
             });          
         });
        });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Email (Contacts), Phone, 
  //a la vez, sobrepasan los 255 caracteres.
  it('Caso de prueba: 4', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan'); 
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
             });          
         });
        });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, 
  //a la vez, sobrepasa los 255 caracteres.
  it('Caso de prueba: 5', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[2]/div[2]/div/div/div').should('have.text', 'The input.contacts.upsert.0.position may not be greater than 255 characters.');
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Phone, 
  //a la vez, sobrepasan los 255 caracteres.
  it('Caso de prueba: 6', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click({ force: true }).then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[2]/div[2]/div/div/div').should('have.text', 'The input.contacts.upsert.0.position may not be greater than 255 characters.');
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Email (Contacts), 
  //a la vez, sobrepasan los 255 caracteres.
  it('Caso de prueba: 7', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Email (Contacts), 
  //Phone, a la vez, sobrepasan los 255 caracteres.
  it('Caso de prueba: 8', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba tiene datos vacios y aun asi permite acceder a la siguiente parte de la ventana.
  it('Caso de prueba: 9', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Phone, 
  //tiene Name (Contacts) datos vacios, aun asi permite acceder a la siguiente parte de la ventana, 
  //a la vez, sobrepasa los 255 caracteres.
  it('Caso de prueba: 10', function () {
  cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
      cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
      //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
          cy.wait(500);
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
          cy.wait(500);
         });          
     });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Email (Contacts),
  //tiene Name (Contacts) datos vacios y aun asi permite acceder a la siguiente parte de la ventana, a la vez, la ventana notifica
  //que Email (Contacts) tiene mas de 255 caracteres.
  it('Caso de prueba: 11', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
             });          
         });
        });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Email (Contacts), Phone,
  //tiene Name (Contacts) datos vacios y aun asi permite acceder a la siguiente parte de la ventana, a la vez, la ventana notifica
  //que Email (Contacts) tiene mas de 255 caracteres, pero, no notifica lo de Phone.
  it('Caso de prueba: 12', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan'); 
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
             });          
         });
        });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position,
  //tiene Name (Contacts) datos vacios, aun asi permite acceder a la siguiente parte de la ventana, 
  //a la vez, sobrepasa los 255 caracteres.
  it('Caso de prueba: 13', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Phone,
  //tiene Name (Contacts) datos vacios, aun asi permite acceder a la siguiente parte de la ventana, 
  //a la vez, sobrepasa los 255 caracteres, pero, no notifica lo de Phone.
  it('Caso de prueba: 14', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Email (Contacts),
  //tiene Name (Contacts) datos vacios y aun asi permite acceder a la siguiente parte de la ventana, a la vez, la ventana notifica
  //que Email (Contacts) tiene mas de 255 caracteres, pero, no notifica lo de Name (Contacts).
  it('Caso de prueba: 15', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Position, Email (Contacts), 
  //Phone y tiene Name (Contacts) datos vacios y aun asi permite acceder a la siguiente parte de la ventana, a la vez, la ventana notifica
  //que Email (Contacts) tiene mas de 255 caracteres, pero, no notifica lo de Phone y Name (Contacts).
  it('Caso de prueba: 16', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
          });          
      });
      });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Name (Contacts), a la vez,
  //sobrepasa los 255 caracteres.
  it('Caso de prueba: 17', function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
          cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Carlosssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809');
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.wait(500);
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
              cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
              cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
              cy.wait(500);
         });          
     });
        });

  //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Name (Contacts), Phone, 
  //a la vez, sobrepasan los 255 caracteres.
  it('Caso de prueba: 18', function () {
  cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('Olman');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/input').type('www.linkedin.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/select').select('Afghanistan');
      cy.xpath('//*[@id="app"]/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div[1]/div/label').click();
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[1]/input').type('Carlosssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[2]/input').type('Senior');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[6]/div/div/div[1]/div/div[5]').click();
      cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
          cy.wait(500);
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/h6').should('have.text', 'warren@hotmail.com');
          cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
          cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
          cy.wait(500);
         });          
     });
        });

afterEach(function () {
      cy.reload();
    });
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

describe('Casos de prueba para la ventana: Estimations', function () {
    beforeEach(function () {
        Cypress.on('uncaught:exception', (err, runnable) => {
            return false
        })
        cy.visit('https://estudiantec.gacela.io/login');

        cy.wait(200)

        cy.get('input[name="email"]').type('warrenalvarez@estudiantec.cr');
        cy.get('input[name="password"]').type('1lTlIewCKP');
        cy.xpath('//*[@id="app"]/div/div/main/div[1]/div/div/div[2]/form[1]/button/h5').click()

        cy.wait(200)

        cy.visit('https://estudiantec.gacela.io/estimations');
    });

    //El siguiente caso de prueba deberia funcionar correctamente, pero, existe un problema que no lo crea correctamente y falla.
    it('Caso de prueba: 1', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
                cy.wait(500);
            });          
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies como vacio antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 2', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
                cy.wait(500);
            });            
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Technologies supere los 255 caracteres antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 3', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'The input.technologies.create.0.name may not be greater than 255 characters.');
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando Buckets este vacio antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 4', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
              cy.wait(500);
            });          
        });
        });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies y Buckets como vacio antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 5', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
                cy.wait(500);
            });            
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Technologies supere los 255 caracteres antes
    //de que se pueda presionar el boton de Save y el campo Buckets este vacio.
    it('Caso de prueba: 6', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'The input.technologies.create.0.name may not be greater than 255 characters.');
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Buckets supere los 255 caracteres antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 7', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
              cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
              cy.wait(500);
            });          
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies como vacio antes
    //de que se pueda presionar el boton de Save y cuando el campo Buckets supere los 255 caracteres.
    it('Caso de prueba: 8', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'Internal server error');
                cy.wait(500);
            });            
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando los campos Buckets y Technologies supere los 255 caracteres antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 9', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            cy.wait(4000);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.xpath('/html/body/div/div/div[2]/main/div[2]').should('contains.text', 'The input.technologies.create.0.name may not be greater than 255 characters.');
                cy.wait(500);
            });            
        });
        });
  
      //El siguiente caso de prueba funciona correctamente.
      it('Caso de prueba: 10', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);         
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies como vacio.
    it('Caso de prueba: 11', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);         
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Technologies supere los 255 caracteres.
    it('Caso de prueba: 12', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);           
        });
        });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando Buckets este vacio.
    it('Caso de prueba: 13', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);        
        });
        });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies y Buckets como vacio.
    it('Caso de prueba: 14', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);         
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Technologies supere los 255 caracteres.
    it('Caso de prueba: 15', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);        
        });
        });

      //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Buckets supere los 255 caracteres.
    it('Caso de prueba: 16', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);     
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando existe el campo Technologies como vacio antes
    //y cuando el campo Buckets supere los 255 caracteres.
    it('Caso de prueba: 17', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('React{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);        
        });
      });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando los campos Buckets y Technologies supere los 255 caracteres.
    it('Caso de prueba: 18', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/input').type('estimation');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[1]/div/div/div[1]/input').type('Golabs S.A');
            //cy.wait(4000)
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/div/ul').click()
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/input').type('Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/div/div/input').type('Reactttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt{enter}');
            cy.wait(500);
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div[2]/div').should('have.text', 'Value is required');
            cy.wait(500);         
        });
        });
 afterEach(function () {
        cy.reload();
    });
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

describe('Casos de prueba para la ventana: Margin Calculator', function () {
    beforeEach(function () {
        Cypress.on('uncaught:exception', (err, runnable) => {
            return false
        })
        cy.visit('https://estudiantec.gacela.io/login');

        cy.wait(200)

        cy.get('input[name="email"]').type('warrenalvarez@estudiantec.cr');
        cy.get('input[name="password"]').type('1lTlIewCKP');
        cy.xpath('//*[@id="app"]/div/div/main/div[1]/div/div/div[2]/form[1]/button/h5').click()

        cy.wait(200)

        cy.visit('https://estudiantec.gacela.io/margin_calculator');
    });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 1', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('39.99999999999999');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('contains.text', 'Margin is below the recommended value required by the company.');     
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 2', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000000');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 3', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 4', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('70.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 5', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('99.99999999999998');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 6', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('99.99999999999999');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba presenta un problema, como permite un Margin mayor a 99.99999999999999, 
    //en los campos Revenue y Profit (que son obtenidos apartir de un calculo matematico de algunas tablas de la aplicacion) salen con error,
    //ya que, no se deberia permitir un Margin mayor al valor anterior, porque literalmente un 100.00000000000000 seria la totalidad del
    //proyecto en cuestion del Margin Calculator, la ventana deberia avisar de esto.
    it('Caso de prueba: 7', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Afghanistan'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('100.00000000000000');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 8', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('39.99999999999999');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('contains.text', 'Margin is below the recommended value required by the company.');     
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 9', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000000');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 10', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 11', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('70.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 12', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('99.99999999999998');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 13', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('99.99999999999999');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba presenta un problema, como permite un Margin mayor a 99.99999999999999, 
    //en los campos Revenue y Profit (que son obtenidos apartir de un calculo matematico de algunas tablas de la aplicacion) salen con error,
    //ya que, no se deberia permitir un Margin mayor al valor anterior, porque literalmente un 100.00000000000000 seria la totalidad del
    //proyecto en cuestion del Margin Calculator, la ventana deberia avisar de esto.
    it('Caso de prueba: 14', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Albania'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('100.00000000000000');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 15', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Algeria'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('39.99999999999999');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('contains.text', 'Margin is below the recommended value required by the company.');     
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 16', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Algeria'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000000');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 17', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Algeria'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('40.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 18', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div/select').select('Algeria'); 
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/div/div[1]/input').type('Senior Fullstack Engineer');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[2]/div/div/div/div/ul').click();
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/div/div[1]/input').type('ALVAREZ HUETE WARREN IVAN');
        cy.wait(4000);
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[3]/div/div/div/div/ul').click()
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/input').clear().type('70.00000000000001');
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[5]/div/div/div/div[1]').should('not.be.visible'); 
      });
 afterEach(function () {
        cy.reload();
    });
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

describe('Casos de prueba para la ventana: Partners', function () {
    beforeEach(function () {
        Cypress.on('uncaught:exception', (err, runnable) => {
            return false
        })
        cy.visit('https://estudiantec.gacela.io/login');

        cy.wait(200)

        cy.get('input[name="email"]').type('warrenalvarez@estudiantec.cr');
        cy.get('input[name="password"]').type('1lTlIewCKP');
        cy.xpath('//*[@id="app"]/div/div/main/div[1]/div/div/div[2]/form[1]/button/h5').click()

        cy.wait(200)

        cy.visit('https://estudiantec.gacela.io/partners');
    });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 1', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[1]/h5').should('contains.text', 'Software');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Phone, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 2', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click({ force: true }).then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[1]/h5').should('contains.text', 'Software');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 3', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').should('not.be.enabled');      
        });
        });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando Phone supere los 255 caracters.
    it('Caso de prueba: 4', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').should('not.be.enabled');     
        });
        });

        //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position tenga mas de 255 caracteres antes
    //de que se pueda presionar el boton de Save.
    it('Caso de prueba: 5', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[2]/div[2]/div/div/div').should('have.text', 'The input.contacts.upsert.0.position may not be greater than 255 characters.');
               });            
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position y Phone
    //tenga mas de 255 caracteres antes de que se pueda presionar el boton de Save.
    it('Caso de prueba: 6', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').click();
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/button[1]').click({ force: true }).then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[2]/div[2]/div/div/div').should('have.text', 'The input.contacts.upsert.0.position may not be greater than 255 characters.');
               });              
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position tenga mas de 255 caracteres antes
    //de que se pueda presionar el boton de Save.
        it('Caso de prueba: 7', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').should('not.be.enabled');      
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position y Phone
    //tenga mas de 255 caracteres antes de que se pueda presionar el boton de Save.
    it('Caso de prueba: 8', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[5]/button').should('not.be.enabled');     
           });
          });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 9', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');     
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Phone
    //tenga mas de 255 caracteres.
    it('Caso de prueba: 10', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');            
           });
          });

        //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 11', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');       
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando Phone supere los 255 caracters.
    it('Caso de prueba: 12', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');   
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position tenga mas de 255 caracteres.
    it('Caso de prueba: 13', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');           
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position y Phone
    //tenga mas de 255 caracteres.
    it('Caso de prueba: 14', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');              
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position tenga mas de 255 caracteres.
        it('Caso de prueba: 15', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');     
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Position y Phone
    //tenga mas de 255 caracteres.
    it('Caso de prueba: 16', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            //cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Olman');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Seniorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warrennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'Value is required');     
           });
          });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 17', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Carlosssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'The maximum length allowed is 255');     
           });
          });

    //El siguiente caso de prueba funciona correctamente, pero, deberia avisar cuando el campo Phone
    //tenga mas de 255 caracteres.
    it('Caso de prueba: 18', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[1]/input').type('Software');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[2]/select').select('Consultant'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div[3]/input').type('https://www.linkedin.com/');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/input').type('Carlosssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/input').type('Senior');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[3]/input').type('warren@hotmail.com');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[4]/input').type('8720-1809999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/div/div[1]/div/div[1]/div/div').should('have.text', 'The maximum length allowed is 255');            
           });
          });
 afterEach(function () {
        cy.reload();
    });
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

describe('Casos de prueba para la ventana: Technical Questions', function () {
    beforeEach(function () {
        Cypress.on('uncaught:exception', (err, runnable) => {
            return false
        })
        cy.visit('https://estudiantec.gacela.io/login');

        cy.wait(200)

        cy.get('input[name="email"]').type('warrenalvarez@estudiantec.cr');
        cy.get('input[name="password"]').type('1lTlIewCKP');
        cy.xpath('//*[@id="app"]/div/div/main/div[1]/div/div/div[2]/form[1]/button/h5').click()

        cy.wait(200)

        cy.visit('https://estudiantec.gacela.io/interview_questions');
    });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 1', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('Angular'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 2', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('Angular'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 3', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('C#'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 4', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('C#'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 5', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('CSS'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 6', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('CSS'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba funciona correctamente.
      it('Caso de prueba: 7', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('GO'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 8', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('GO'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 9', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('HTML'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 10', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('HTML'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 11', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('Java, Python, C++, JavaScript'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 12', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('Java, Python, C++, JavaScript'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 13', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('PHP'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 14', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('PHP'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

    //El siguiente caso de prueba funciona correctamente.
    it('Caso de prueba: 15', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('PYTHON'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 16', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('PYTHON'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba funciona correctamente.
      it('Caso de prueba: 17', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('React'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testing{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

      //El siguiente caso de prueba genera un desbordamiento en la ventana, debido a la gran cantidad de caracteres de Tags, 
    //a la vez, sobrepasa los 255 caracteres.
    it('Caso de prueba: 18', function () {
        cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/nav/div/div[2]/div/div[2]/button').click().then(function () {
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[1]/div/select').select('React'); 
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[2]/div/trix-editor').type('Proyecto');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[3]/div/trix-editor').type('Test');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[4]/div/select').select('Easy');
            cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div[1]/div[2]/div[5]/div/div/input').type('Testingggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg{enter}');
            cy.xpath('/html/body/div[1]/div/div[2]/main/div[1]/div/div[1]/div[3]/button[1]').click().then(function () {            
                cy.wait(500);
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[1]/p[1]/div').should('have.text', 'Proyecto');
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button').click();
                cy.xpath('/html/body/div/div/div[2]/main/div[1]/div/div/div[1]/div/div[2]/div/button[2]').click();
                cy.wait(500);
            });            
        });
        });

 afterEach(function () {
        cy.reload();
    });
});
