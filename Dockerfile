
# Use official Ruby image matching your Rails version
FROM ruby:3.4.1

# Install Rails 7 + Hotwire/Turbo dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Set working directory
WORKDIR /app

# Copy dependency files first (for caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy entire app
COPY . .

# Expose port
EXPOSE 3000

# Startup command
CMD ["rails", "server", "-b", "0.0.0.0"]