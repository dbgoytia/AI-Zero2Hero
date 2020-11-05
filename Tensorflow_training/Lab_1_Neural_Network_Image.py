#
# First lab using neural networks
# This training is intended to be my notes around training.
# I don't take any credit for making this lab.
# 
#
# Goal: Train the MNIST dataset (handwritten data), and
# train an ML model using Tensorflow for predicting the value of a
# handwritten letter or number.
# 
# Taken from: https://github.com/tensorflow/docs/blob/master/site/en/tutorials/quickstart/beginner.ipynb


import tensorflow as tf

mnist = tf.keras.datasets.mnist

(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# Keras sequential model
# Stack layers, choose optimizer and loss function for training:

model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(input_shape=(28, 28)),
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dropout(0.2),
  tf.keras.layers.Dense(10)
])


predictions = model(x_train[:1]).numpy()


# Review the predictions
# Each of  this represent a vector of "logits" or "log-odds" scores, one per class
print("Predictions for the trained moel:")
print(predictions)

# Convert these logits to probabilities
tf.nn.softmax(predictions).numpy()

loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)

model.compile(optimizer='adam',
              loss=loss_fn,
              metrics=['accuracy'])

model.fit(x_train, y_train, epochs=5)

model.evaluate(x_test,  y_test, verbose=2)

probability_model = tf.keras.Sequential([
  model,
  tf.keras.layers.Softmax()
])

probability_model(x_test[:5])
