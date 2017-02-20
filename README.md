# Info

This image include WebDriverIO for codeceptjs.

Working directory is `/tests`

# Sample

## Using with `selenium/standalone-chrome`

### Prepare docker images

- docker pull soulmaneller/codeceptjs-alpine
- docker pull selenium/standalone-chrome

### Initial codeceptjs-test

- Create a directory `codeceptjs`
- Open terminal and move to directory which you created `cd codeceptjs`
- Initial codeceptjs configuration, run `codeceptjs init`
    - Select `WebDriverIO`
    - Browser for testing `chrome`

    Sample `codecept.json` file
    ``` json
    {
      "tests": "./*_test.js",
      "timeout": 10000,
      "output": "./output",
      "helpers": {
        "WebDriverIO": {
          "host": "selenium",        // hostname of selenium
          "url": "http://localhost", // server's url
          "browser": "chrome"
        }
      },
      "include": {
        "I": "./steps_file.js"
      },
      "bootstrap": false,
      "mocha": {},
      "name": "codeceptjs"
    }
    ```
- Move curser to root path `cd ..`
- Create `docker-compose.yml` on root path
    ``` yml
    version: '2'
    services:
        codeceptjs:
            image: soulmaneller/codeceptjs
            links:
                - chrome:selenium   # Set hostname of selenium this must match WebDriverIO hostname
            volumes:
                - ./codeceptjs:/tests

        chrome:
            image: selenium/standalone-chrome
    ```

- Start testing `docker-compose up` from root path
