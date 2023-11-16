import React, {useContext, useState} from 'react';
import PropTypes from 'prop-types';
import './ControlPanel.scss';
import { PaletteContext } from '../../context/PaletteContext';
import PalettePreviewer from '../PalettePreviewer/PalettePreviewer';
import ActionButton from '../ActionButton/ActionButton';

const ControlPanel = () => {
  const [palette, setPalette] = useContext(PaletteContext);
  const [buttonFlag, setButtonFlag] = useState(true);

  return (
  <div className="ControlPanel" data-testid="ControlPanel">
    <h2>Control Panel</h2>
      <PalettePreviewer palette={palette} />
      <ActionButton name='Generate Palette' propPalette={palette} propAction={async () => { setPalette(await palette.GeneratePalette()) }} />
      <ActionButton name='Adjust Palette' propPalette={palette} propAction={() => { setPalette(palette.AdjustPalette()) }} />
      <ActionButton name='Copy Palette' propPalette={palette} propAction={() => { palette.CopyPalette() }} />
  </div>
  );

}
ControlPanel.propTypes = {};

ControlPanel.defaultProps = {};

export default ControlPanel;
