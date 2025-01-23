from flask import Flask, request, jsonify
from flask_cors import CORS  # Import CORS
import cv2
from pyzbar.pyzbar import decode
import numpy as np
import json

app = Flask(__name__)

# Enable CORS for all origins (you can restrict this to specific domains if needed)
CORS(app)

@app.route('/scan_qr', methods=['POST'])
def scan_qr():
    print("Received request")
    if 'image' not in request.files:
        print("No image file found")
        return jsonify({'error': 'No image file found'}), 400

    # Get the image from the POST request
    file = request.files['image']
    print(f"Received file: {file.filename}")
    file_bytes = np.frombuffer(file.read(), np.uint8)
    frame = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)

    # Decode the QR code
    decoded_objects = decode(frame)
    if decoded_objects:
        # Extract the first decoded QR code data
        qr_data = decoded_objects[0].data.decode('utf-8')
        print("QR code found")
        print(f"QR code data: {qr_data}")

        # Get the position of the QR code (bounding box)
        qr_points = decoded_objects[0].polygon
        if len(qr_points) == 4:
            # Calculate the center of the QR code bounding box
            x_coords = [point.x for point in qr_points]
            y_coords = [point.y for point in qr_points]
            x_center = sum(x_coords) / 4
            y_center = sum(y_coords) / 4
            # Map the 2D position to a 3D space (simple example)
            qr_position = {
                'x': (x_center - frame.shape[1] / 2) / 100,  # Scale to 3D space
                'y': -(y_center - frame.shape[0] / 2) / 100,
                'z': 0  # You can adjust this as needed
            }
            print(f"QR code position: {qr_position}")
            return jsonify({'data': json.dumps(qr_position)})

        else:
            return jsonify({'error': 'QR code bounding box not detected correctly'}), 400
    else:
        print("No QR code found")
        return jsonify({'error': 'No QR code found'}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
