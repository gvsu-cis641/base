using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI;

public class Movment : MonoBehaviour
{
    public bool up;
    public bool down;
    public bool right;
    public bool left;
    public float speed;

    public void setUpState (bool state)
    {
        up = state;
    }

    public void setDownState(bool state)
    {
        down = state;
    }

    public void setRightState(bool state)
    {
        right = state;
    }

    public void setLeftState(bool state)
    {
        left = state;
    }




    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //float x = Input.GetAxisRaw(“Horizontal”);
        //float y = Input.GetAxisRaw(“Vertical”);
        

        if (up)
        {
            gameObject.transform.position = new Vector2(transform.position.x, transform.position.y + speed);
        }
        else if (down)
        {
            gameObject.transform.position = new Vector2(transform.position.x, transform.position.y + -speed);
        }
        else if (right)
        {
            gameObject.transform.position = new Vector2(transform.position.x + speed, transform.position.y);
        }
        else if (left)
        {
            gameObject.transform.position = new Vector2(transform.position.x + -speed, transform.position.y);
        }
    }
}
