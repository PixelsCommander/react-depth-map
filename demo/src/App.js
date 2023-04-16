import './App.css';
import ImageDepthMap from "react-depth-map";

function App() {
  return (
          <ImageDepthMap
              originalImg={'./photo.webp'}
              depthImg={'./depth.png'}
              verticalThreshold={30}
              horizontalThreshold={40}
              multiplier={3}
              style={{
                  borderRadius: '50%',
              }}
          />
  );
}

export default App;
