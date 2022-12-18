Feature: user report a repair
  As a user, I want to report a problem I see

Background: reports in database

  Given the following reports exist:
  |building |area |problemtype |emergencylevel |status |uni |
  |Butler|Restroom 4th FL|Plumbing|Emergent|Uncomplete|yp2604|
  |Pupin|Lab1034|Electronic|Emergent|Uncomplete|yp2604|
  |Wien|Room 523|Heat|Ordinary|Uncomplete|yp2604|
  |Uris|Class Room 301|CVN|Ordinary|Uncomplete|yp2604|
  |Butler|Computer 52|Internet|Ordinary|Uncomplete|yp2604|

  Given the following managers exist:
  |email |password |name |
  |yp2604@columbia.edu|test123|Yanghui Pang|

Scenario: User reports a new issue
  Given I am on the submit report page
  When I select "Laundry" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Mudd"
    And I fill in "Area" with "Lounge"
    And I fill in "Please enter your UNI" with "dh3071"
    And I fill in "Description" with "Laundry Machine Failed"
    And I press "Publish"
  Then I should be on the home page
  Then I should see "successfully published"

Scenario: User reports a new issue with invalid uni
  Given I am on the submit report page
  When I select "Electronic" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Mudd"
    And I fill in "Area" with "Lounge"
    And I fill in "Please enter your UNI" with "xxx"
    And I press "Publish"
 Then I should be on the home page
 Then I should see "invalid UNI"

Scenario: User reports an existing issue
  Given I am on the submit report page
  When I select "Plumbing" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Butler"
    And I fill in "Area" with "Restroom 4th FL"
    And I fill in "Please enter your UNI" with "dch3071"
    And I press "Publish"
  Then I should be on the home page
  Then I should see "Already been published"

Scenario: User reports a new issue by scanning QR code
  Given I am on the submit report page of "1st floor restroom" in "Mudd"
  Then the "Location: Building" field should contain "Mudd"
    And the "Location: Area" field should contain "1st floor restroom"
  When I select "Other" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Please enter your UNI" with "dh3071"
    And I press "Publish"
   Then I should be on the home page
 Then I should see "successfully published"