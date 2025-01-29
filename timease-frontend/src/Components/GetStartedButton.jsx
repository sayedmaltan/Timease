import React from "react";
import { Button } from "react-bootstrap";

function GetStartedButton({ text = "Get Started", size = "sm" }) {
  return (
    <Button variant="primary" size={size}>
      {text}
    </Button>
  );
}

export default GetStartedButton;
