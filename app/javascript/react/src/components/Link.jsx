import React from "react";
import P from "prop-types";

export const Link = ({ title, path }) => {
  return (
    <div className="item_menu ml-2">
      <a href={path}>{title}</a>
    </div>
  );
};

Link.propTypes = {
  title: P.string.isRequired,
  path: P.string.isRequired,
};
