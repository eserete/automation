FROM ruby:2.5
# Set timezone
RUN echo "America/Sao_Paulo" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Create a default user
RUN useradd automation --shell /bin/bash --create-home

RUN apt-get update && apt-get install -yq \
    chromium \
    git-core \
    xvfb \
    xsel \
    unzip

# chromeDriver v2.35
RUN wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/bin/ \
    && rm /tmp/chromedriver.zip

RUN ln -s /usr/bin/chromium-browser \
    && chmod 777 /usr/bin/chromium-browser

RUN mkdir -p /app
WORKDIR /app

RUN gem update
ADD src .
ADD Gemfile .

RUN bundle install

RUN cucumber --tags @wip features/login.feature