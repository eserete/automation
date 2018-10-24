FROM ruby:2.5
# Set timezone
RUN echo "America/Sao_Paulo" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Create a default user
RUN useradd automation --shell /bin/bash --create-home

# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

RUN apt update && apt install -y unzip
# Install Chrome WebDriver
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
    ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver


RUN chromedriver -v

RUN mkdir -p /app
WORKDIR /app

RUN gem update
ADD src .
ADD Gemfile .

RUN bundle install

RUN cucumber --tags @wip features/login.feature