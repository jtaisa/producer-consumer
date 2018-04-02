if [ -z "$MONGO_HOST" ];
then
  export MONGO_HOST=127.0.0.1
fi

if [ -z "$MONGO_PORT" ];
then
  export MONGO_PORT=27017
fi

if [ -z "$KAFKA_HOST" ];
then
  export KAFKA_HOST=127.0.0.1
fi

if [ -z "$KAFKA_PORT" ];
then
  export KAFKA_PORT=9092
fi

if [ -z "$KAFKA_TOPIC" ];
then
  export KAFKA_TOPIC=pctest
fi

if [ -z "$RACK_ENV" ];
then
  export RACK_ENV=development
fi

if [ -z "$PORT" ];
then
  export PORT=9290
fi

if [ "$RACK_EN" == "production" ];
then
  bundle install --without development test
else
  bundle install
fi

if [ ! -z "$1" ];
then
  sleep $1
fi

bundle exec thin -R config.ru -p $PORT -e $RACK_ENV start