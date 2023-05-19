Feature("etc");

Scenario("test something", ({ I }) => {
  I.amOnPage("http://localhost:3000");
  I.seeInTitle('Create Next App');
  I.wait(3);
  I.fillField('content',new Date());
  I.click('Save');
});
