import React from "react";
import P from "prop-types";

export const Button = ({ title, path, method, onClick }) => {
  const csrf = document
    .querySelector("meta[name='csrf-token']")
    .getAttribute("content");

  return (
    <div>
      {onClick ? (
        <form action={path} method="post">
          <input type="hidden" name="_method" value={method} />
          <button type="submit" className="text-red-600">
            {title}
          </button>
          <input type="hidden" name="authenticity_token" value={csrf} />
        </form>
      ) : (
        <button onClick={onClick} className="">
          {title}
        </button>
      )}
    </div>
  );
};

Button.propTypes = {
  title: P.string.isRequired,
  onClick: P.func,
  path: P.string,
  method: P.string,
};
