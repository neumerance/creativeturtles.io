# Use the official Ruby image as a base
FROM ruby:3.3.1

# Set environment variables
ENV NODE_VERSION 20
ENV RAILS_ENV=development

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  imagemagick \
  ffmpeg \
  poppler-utils \
  curl \
  git \
  vim \
  libvips42

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
    apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the application code
COPY . .

# Precompile assets
# RUN RAILS_ENV=production bundle exec rails assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
