Feature: MINTS - Basic REST - MINTS_Basic_REST

	Background:
		Given variable TestID is "MINTS_Basic_REST"
		And variable INTID is "I0002"
		And variable InputFileLocation is "/usr/src/app/resources/git-projects/MINTS"
		And variable ExpectedFileLocation is "/usr/src/app/resources/git-projects/MINTS"

	Scenario: MINTS - Basic REST - Rest url - MINTS_Basic_REST.1
		When <authorization>When Hit REST API:"https://mints.cf/gateway" with method:"GET"<headers_included>
		Then Validate Status with statusCode:"200"

	Scenario Outline: MINTS - Basic REST - Post message test - MINTS_Basic_REST.2
		When <authorization>When Hit REST API:"https://reqbin.com/echo/post/json" with method:"POST"<headers_included>
		Then Post message:"<InputMessage>" to API
		Then Validate Status with statusCode:"200"

		Examples:
			| InputMessage 	|
			| /REST_Inputs/REST_Post.json 	|

	Scenario Outline: MINTS - Basic REST - Validate expected message - MINTS_Basic_REST.3
		When <authorization>When Hit REST API:"https://jsonplaceholder.typicode.com/comments?postId=1" with method:"GET"<headers_included>
		Then Validate "<ExpectedMessage>" of type:"json"

		Examples:
			| ExpectedMessage 	|
			| /REST_Inputs/REST.json 	|

	Scenario Outline: MINTS - Basic REST - Validate input and expected message - MINTS_Basic_REST.4
		When <authorization>When Hit REST API:"https://reqbin.com/echo/post/json" with method:"POST"<headers_included>
		Then Post message:"<InputMessage>" to API
		Then Validate "<ExpectedMessage>" of type:"json" with statusCode:"200"

		Examples:
			| InputMessage 	| ExpectedMessage 	|
			| /InputFileLocation/I0003_MTX_Post_Input_1.xml 	| /REST_Inputs/REST_Post_Exp.json 	|